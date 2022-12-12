import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/screen/components/button_component.dart';

import '../../utils/constant/app_colors.dart';
import '../../utils/constant/app_text_style.dart';
import '../components/form_component.dart';

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

  @override
  Widget build(BuildContext context) {
    _nameController.text = 'Sabrina Maharani';
    _phoneController.text = '+6282110766872';
    _emailController.text = 'sabrina07@upi.edu';
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 30.h, left: 16.w, right: 16.w),
        child: ButtonComponent(
            onPress: () {},
            textButton: 'Save',
            buttonHeight: 40.h,
            buttonWidth: 330.w),
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
                width: 100.w,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35.w,
                      backgroundColor: AppColors.bg1,
                      foregroundColor: Colors.black,
                      child: Icon(
                        Icons.person_rounded,
                        size: 60.w,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Change Profile Photo',
                      style:
                          TextStyle(color: AppColors.primary4, fontSize: 12.sp),
                    )
                  ],
                ),
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
