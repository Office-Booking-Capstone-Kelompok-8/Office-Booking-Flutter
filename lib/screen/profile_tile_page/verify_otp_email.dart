import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/user_provider.dart';
import 'package:office_booking_app/screen/components/form_component.dart';
import 'package:provider/provider.dart';

import '../../utils/constant/app_colors.dart';
import '../../utils/constant/app_text_style.dart';
import '../components/button_component.dart';
import '../components/show_state.dart';
import '../components/snackbar_component.dart';

class VerifyOtpEmail extends StatefulWidget {
  const VerifyOtpEmail({super.key});

  @override
  State<VerifyOtpEmail> createState() => _VerifyOtpEmailState();
}

class _VerifyOtpEmailState extends State<VerifyOtpEmail> {
  late TextEditingController _otpController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    return Consumer<UserProvider>(builder: (context, provider, _) {
      showState(provider);
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
                    'Confirm OTP code',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Enter OTP Code sent to $email',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'OTP Code',
                    style: formTop,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  FormComponent(
                    isNumber: true,
                    isAuth: true,
                    formHeight: 40.h,
                    formWidth: double.infinity,
                    controller: _otpController,
                    prefixIcon: Icons.lock_outline,
                    hint: 'OTP Code',
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'OTP is required';
                      } else if (int.tryParse(value) == null) {
                        return 'OTP can only consist of numbers';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Didn’t receive OTP code? ",
                        style: TextStyle(color: AppColors.text1),
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            final result = await provider.sendOtp(email: email);
                            if (mounted) {}

                            if (result != null) {
                              showNotification(context, result);
                            }
                          } catch (e) {
                            showNotification(context, e.toString());
                          }
                        },
                        child: const Text(
                          'Resend Code',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.primary4),
                        ),
                      ),
                    ],
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
                        try {
                          final result = await provider.verfyOtp(
                              email: email, code: _otpController.text);
                          if (mounted) {}
                          if (result == 'email verified successfully') {
                            showNotification(context, result!);
                            Navigator.pop(context);
                          } else {
                            showNotification(context, result!);
                          }
                        } catch (e) {
                          showNotification(context, e.toString());
                        }
                      }
                    },
                    textButton: 'Confirm',
                  ),
                ],
              ),
            ),
          )),
        ),
      );
    });
  }
}
