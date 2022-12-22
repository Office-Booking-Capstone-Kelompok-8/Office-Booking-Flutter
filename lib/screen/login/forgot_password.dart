import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/login_provider.dart';
import 'package:office_booking_app/screen/components/form_component.dart';
import 'package:provider/provider.dart';

import '../../utils/constant/app_text_style.dart';
import '../components/button_component.dart';
import '../components/show_state.dart';
import '../components/snackbar_component.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _key;

  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (args['email'] != null && args['key'] != null) {
      _email = args['email'];
      _key = args['key'];
    } else {
      _email = '';
      _key = '';
    }
    return Consumer<SignInProvider>(builder: (context, provider, _) {
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
                    'Create a new password',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'The new password must be different from the previously used password',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'Password',
                    style: formTop,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  FormComponent(
                    isPassword: true,
                    isAuth: true,
                    formHeight: 40.h,
                    formWidth: double.infinity,
                    controller: _passwordController,
                    prefixIcon: Icons.lock_outline,
                    hint: 'Password',
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
                    height: 16.h,
                  ),
                  Text(
                    'Confirm Password',
                    style: formTop,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  FormComponent(
                    isPassword: true,
                    isAuth: true,
                    formHeight: 40.h,
                    formWidth: double.infinity,
                    controller: _confirmPasswordController,
                    prefixIcon: Icons.lock_outline,
                    hint: 'Confirm password',
                    validation: (value) {
                      if (value != _passwordController.text) {
                        return 'Password and password confirmation must be the same';
                      } else {
                        return null;
                      }
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
                        try {
                          final result = await provider.resetPassword(
                              email: _email,
                              password: _confirmPasswordController.text,
                              key: _key);
                          if (mounted) {}
                          if (result == 'password reset successfully') {
                            showNotification(context, result!);
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/login', (route) => false);
                          } else if (result != null) {
                            showNotification(context, '$result Please Login');
                          }
                        } catch (e) {
                          showNotification(context, e.toString());
                        }
                      }
                    },
                    textButton: 'Create Password',
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
