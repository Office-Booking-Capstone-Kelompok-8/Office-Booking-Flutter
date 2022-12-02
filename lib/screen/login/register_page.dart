import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:provider/provider.dart';

import '../../provider/login_provider.dart';
import '../../utils/state/finite_state.dart';
import '../components/button_component.dart';
import '../components/form_component.dart';
import '../components/snackbar_component.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              children: [
                Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Text(
                    'Create your account',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: FormComponent(
                    isAuth: true,
                    formHeight: 48.h,
                    formWidth: double.infinity,
                    controller: _nameController,
                    prefixIcon: Icons.person_outline,
                    hint: 'Full name',
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: FormComponent(
                    isNumber: true,
                    isAuth: true,
                    formHeight: 48.h,
                    formWidth: double.infinity,
                    controller: _phoneController,
                    prefixIcon: Icons.phone_outlined,
                    hint: 'Phone number',
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number is required';
                      } else if (int.tryParse(value) == null) {
                        return 'Phone Number can only consist of numbers';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: FormComponent(
                    isAuth: true,
                    isEmail: true,
                    formHeight: 48.h,
                    formWidth: double.infinity,
                    controller: _emailController,
                    prefixIcon: Icons.email_outlined,
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
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: FormComponent(
                    isPassword: true,
                    isAuth: true,
                    formHeight: 48.h,
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
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: FormComponent(
                    isPassword: true,
                    isAuth: true,
                    formHeight: 48.h,
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
                ),
                SizedBox(
                  height: 76.h,
                ),
                ButtonComponent(
                  buttonHeight: 40.h,
                  buttonWidth: double.infinity,
                  onPress: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (_formKey.currentState!.validate()) {
                      try {
                        final response = await provider.signUp(
                            name: _nameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                            password: _passwordController.text);
                        if (mounted) {}
                        if (response == 'user created successfully') {
                          showNotification(context, '$response please login');

                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        } else if (response != null) {
                          showNotification(context, response);
                        }
                      } catch (e) {
                        showNotification(context, e.toString());
                      }
                    }
                  },
                  textButton: 'Register',
                ),
                Container(
                  padding: EdgeInsets.only(right: 10.w, top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: AppColors.text1),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        },
                        child: const Text(
                          'Sign In',
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
        ))),
      );
    });
  }
}
