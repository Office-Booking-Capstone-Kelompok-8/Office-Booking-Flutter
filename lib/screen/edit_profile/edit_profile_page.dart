// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/user_provider.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/screen/components/snackbar_component.dart';
import 'package:provider/provider.dart';

import '../../utils/constant/app_colors.dart';
import '../../utils/constant/app_text_style.dart';
import '../components/form_component.dart';
import '../components/show_state.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  ValueNotifier<File?> fileImage = ValueNotifier<File?>(null);
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<UserProvider>(context, listen: true);
    showState(profile);
    _nameController.text = profile.getUsers!.name!;
    _phoneController.text = profile.getUsers!.phone!;
    _emailController.text = profile.getUsers!.email!;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 30.h, left: 16.w, right: 16.w),
        child: ValueListenableBuilder(
            valueListenable: fileImage,
            builder: (context, value, _) {
              return ButtonComponent(
                  onPress: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await profile.editProfile(
                        _nameController.text,
                        _emailController.text,
                        _phoneController.text,
                      );
                      if (value != null) {
                        final responseImage =
                            await profile.editPicture(file: value);
                        if (responseImage != null) {
                          await profile.getUsersDetail();
                          if (mounted) {}
                        }
                        print(responseImage);
                      }
                      showNotification(context, response);
                      Navigator.popAndPushNamed(context, '/navbar');
                    }
                  },
                  textButton: 'Save',
                  buttonHeight: 40.h,
                  buttonWidth: double.infinity);
            }),
      ),
      appBar: const AppbarComponent(title: 'Edit Profile'),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  // height: 85.h,
                  width: 150.w,
                  child: ValueListenableBuilder(
                      valueListenable: fileImage,
                      builder: (context, value, _) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 24.h),
                              height: 90.w,
                              width: 90.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: (value != null)
                                    ? Image.file(
                                        value,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        profile.getUsers!.picture!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            InkWell(
                              onTap: () async {
                                final result = await FilePicker.platform
                                    .pickFiles(type: FileType.image);
                                if (result == null) return;
                                // Mendapatkan file yang telah di pick
                                final PlatformFile file = result.files.first;
                                // Membuka file terpilih
                                fileImage.value = File(file.path.toString());
                              },
                              child: Text(
                                'Change Profile Photo',
                                style: TextStyle(
                                    color: AppColors.primary4, fontSize: 12.sp),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Full Name',
                style: formTop,
              ),
              SizedBox(
                height: 8.h,
              ),
              FormComponent(
                isProfile: true,
                hint: profile.getUsers!.name!,
                isDisable: false,
                controller: _nameController,
                formHeight: 40.h,
                formWidth: double.infinity,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter at least 4 characters';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Phone Number',
                style: formTop,
              ),
              SizedBox(
                height: 8.h,
              ),
              FormComponent(
                isProfile: true,
                hint: profile.getUsers!.phone,
                isDisable: false,
                isNumber: true,
                controller: _phoneController,
                formHeight: 40.h,
                formWidth: double.infinity,
                validation: (value) {
                  if (value == null || value.isEmpty || value.length < 11) {
                    return 'Enter the right number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Email',
                style: formTop,
              ),
              SizedBox(
                height: 8.h,
              ),
              FormComponent(
                isProfile: true,
                hint: profile.getUsers!.email,
                isDisable: false,
                controller: _emailController,
                formHeight: 40.h,
                formWidth: double.infinity,
                validation: (value) {
                  const String expression = "[a-zA-Z0-9+._%-+]{1,256}"
                      "\\@"
                      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
                      "("
                      "\\."
                      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
                      ")+";
                  final RegExp regExp = RegExp(expression);
                  return !regExp.hasMatch(value!)
                      ? "Can only consist of letters, numbers and special characters (@.-_)"
                      : value.isEmpty
                          ? 'email is required'
                          : null;
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
