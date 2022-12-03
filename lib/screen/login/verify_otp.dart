import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:office_booking_app/provider/login_provider.dart';
import 'package:office_booking_app/screen/components/form_component.dart';
import 'package:provider/provider.dart';

import '../../utils/constant/app_colors.dart';
import '../../utils/state/finite_state.dart';
import '../components/button_component.dart';
import '../components/snackbar_component.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
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
    return Consumer<SignInProvider>(builder: (context, provider, _) {
      if (provider.myState == MyState.loading) {
        SmartDialog.show(builder: (context) {
          return Container(
            height: 150.w,
            width: 150.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: AppColors.primary4,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text('Loading...',
                      style: TextStyle(color: AppColors.primary4)),
                ],
              ),
            ),
          );
        });
      } else if (provider.myState == MyState.failed) {
        SmartDialog.dismiss();
        SmartDialog.show(builder: (context) {
          return Container(
            height: 100.w,
            width: 180.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child:
                const Text('Gagal', style: TextStyle(color: AppColors.error5)),
          );
        });
      } else {
        SmartDialog.dismiss();
      }

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
                          if (result!['message'] ==
                              'otp verified successfully') {
                            showNotification(context, result['message']);
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/forgot-password', (route) => false,
                                arguments: result);
                          } else {
                            showNotification(context, result['message']);
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
