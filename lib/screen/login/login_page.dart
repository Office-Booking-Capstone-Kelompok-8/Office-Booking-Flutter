import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';

import '../components/button_component.dart';
import '../components/form_component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Form(
        key: formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.h),
                child: Text(
                  'Selamat Datang Kembali!',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.w),
                child: FormComponent(
                  isAuth: true,
                  formHeight: 48.h,
                  formWidth: double.infinity,
                  controller: _emailController,
                  prefixIcon: Icons.mail_outline,
                  hint: 'Email',
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 0),
                child: FormComponent(
                  isAuth: true,
                  isPassword: true,
                  formHeight: 48.h,
                  formWidth: double.infinity,
                  controller: _passwordController,
                  prefixIcon: Icons.lock_outline,
                  hint: 'Password',
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
                        'Lupa Pasword?',
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
                buttonWidth: 240.w,
                onPress: () {
                  Navigator.pushNamed(context, '/navbar');
                },
                textButton: 'MASUK',
              ),
              Container(
                padding: EdgeInsets.only(right: 10.w, top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Belum punya akun?',
                      style: TextStyle(color: AppColors.text1),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/register', (route) => false);
                      },
                      child: const Text(
                        'Daftar',
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
  }
}
