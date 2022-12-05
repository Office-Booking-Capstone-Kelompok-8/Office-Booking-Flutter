import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/login_provider.dart';
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
    final tkn = Provider.of<SignInProvider>(context, listen: false);
    showState(profile);
    _nameController.text = profile.getUsers.name ?? 'Sabrina Maharani';
    _phoneController.text = profile.getUsers.phone ?? '+6282110766872';
    _emailController.text = profile.getUsers.email ?? 'sabrina07@upi.edu';
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 30.h, left: 16.w, right: 16.w),
        child: ValueListenableBuilder(
            valueListenable: fileImage,
            builder: (context, value, _) {
              return ButtonComponent(
                  onPress: () async {
                    final response = await profile.editProfile(
                        _nameController.text,
                        _emailController.text,
                        _phoneController.text,
                        tkn.users!.accessToken!);
                    print(response);
                    if (value != null) {
                      final responseImage = await profile.editPicture(
                          file: value, token: tkn.users!.accessToken!);
                      if (responseImage != null) {
                        await profile.getUsersDetail(tkn.users!.accessToken!);
                        if (mounted) {}
                        showNotification(context, responseImage);
                      }
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
                            margin: EdgeInsets.only(top: 8.h),
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
                                      profile.getUsers.picture ??
                                          'https://unsplash.com/photos/OLLtavHHBKg/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8M3x8aWNvbiUyMHBlcnNvbnxlbnwwfDJ8fHwxNjcwMjE3NjIz&force=true&w=640',
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
              height: 16.h,
            ),
            Text(
              'Full Name',
              style: formTop,
            ),
            FormComponent(
              controller: _nameController,
              formHeight: 40.h,
              formWidth: 328.w,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Phone Number',
              style: formTop,
            ),
            FormComponent(
              controller: _phoneController,
              formHeight: 40.h,
              formWidth: 328.w,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Email',
              style: formTop,
            ),
            FormComponent(
              controller: _emailController,
              formHeight: 40.h,
              formWidth: 328.w,
            ),
          ],
        ),
      )),
    );
  }
}
