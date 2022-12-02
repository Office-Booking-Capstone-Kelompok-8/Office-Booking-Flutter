import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/form_component.dart';

import '../../utils/constant/app_colors.dart';
import '../components/button_component.dart';

class SendOtp extends StatefulWidget {
  const SendOtp({super.key});

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  late TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset your password',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Enter the email associated with your account and we will send an email with instructions for resetting your password',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                FormComponent(
                  isEmail: true,
                  isAuth: true,
                  formHeight: 40.h,
                  formWidth: double.infinity,
                  controller: _emailController,
                  prefixIcon: Icons.mail_outline,
                  hint: 'Email',
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
                SizedBox(
                  height: 32.h,
                ),
                ButtonComponent(
                  buttonHeight: 40.h,
                  buttonWidth: double.infinity,
                  onPress: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/verify-otp', (route) => false);
                    }
                  },
                  textButton: 'Send',
                ),
                Container(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Back to ",
                        style: TextStyle(color: AppColors.text1),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.primary4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
