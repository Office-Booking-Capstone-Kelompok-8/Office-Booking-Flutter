import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/state/finite_state.dart';
import 'package:provider/provider.dart';

import '../../provider/login_provider.dart';
import '../components/button_component.dart';
import '../components/form_component.dart';
import '../components/snackbar_component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
                    'Sign in to your account',
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
                          ? "Please, input valid email!"
                          : null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: FormComponent(
                    isAuth: true,
                    isPassword: true,
                    formHeight: 48.h,
                    formWidth: double.infinity,
                    controller: _passwordController,
                    prefixIcon: Icons.lock_outline,
                    hint: 'Password',
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field cannot be empty';
                      }
                      if (value.length < 8) {
                        return 'field must be longer than 8 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10.w),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.primary4),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                ButtonComponent(
                  buttonHeight: 40.h,
                  buttonWidth: double.infinity,
                  onPress: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (_formKey.currentState!.validate()) {
                      try {
                        final result = await provider.signIn(
                            email: _emailController.text,
                            password: _passwordController.text);
                        if (mounted) {}
                        if (result == 'Login successful') {
                          showNotification(context, result!);
                          // if (args != null) {
                          //   Navigator.pop(args);
                          // }
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/navbar', (route) => false);
                        } else if (result != null) {
                          showNotification(context, result);
                        }
                      } catch (e) {
                        showNotification(context, e.toString());
                      }
                    }
                  },
                  textButton: 'Login',
                ),
                Container(
                  padding: EdgeInsets.only(right: 10.w, top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account yet?",
                        style: TextStyle(color: AppColors.text1),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/register', (route) => false);
                        },
                        child: const Text(
                          ' Sign up',
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
