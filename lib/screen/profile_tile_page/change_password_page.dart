import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/screen/components/form_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController _oldPassword = TextEditingController();
  late TextEditingController _newPassword = TextEditingController();
  late TextEditingController _confirmPassword = TextEditingController();
  @override
  void initState() {
    _oldPassword = TextEditingController();
    _newPassword = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarComponent(title: 'Change Password'),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  'Please enter your current password to maintain account security',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.h,
                ),
                FormComponent(
                  isPassword: true,
                  isAuth: true,
                  formHeight: 40.h,
                  formWidth: double.infinity,
                  controller: _oldPassword,
                  prefixIcon: Icons.lock_outline,
                  hint: 'enter old password',
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 8) {
                      return '8-20 characters consisting of letters and numbers';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                FormComponent(
                  isPassword: true,
                  isAuth: true,
                  formHeight: 40.h,
                  formWidth: double.infinity,
                  controller: _newPassword,
                  prefixIcon: Icons.lock_outline,
                  hint: 'enter new password',
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 8) {
                      return '8-20 characters consisting of letters and numbers';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                FormComponent(
                  isPassword: true,
                  isAuth: true,
                  formHeight: 40.h,
                  formWidth: double.infinity,
                  controller: _confirmPassword,
                  prefixIcon: Icons.lock_outline,
                  hint: 'confirm password',
                  validation: (value) {
                    if (value != _newPassword.text) {
                      return 'Password and password confirmation must be the same';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(color: AppColors.primary4),
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/send-otp');
                  },
                  child: const Text(
                    'Forgot Password ?',
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 30.h, left: 16.w, right: 16.w),
          child: ButtonComponent(
              onPress: () {},
              textButton: 'Reset',
              buttonHeight: 40.h,
              buttonWidth: double.infinity),
        ),
      ),
    );
  }
}
