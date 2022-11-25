import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';

import '../components/button_component.dart';
import '../components/form_component.dart';

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
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.h),
                child: Text(
                  'Pendaftaran',
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
                  controller: _nameController,
                  prefixIcon: Icons.person_outline,
                  hint: 'Nama Lengkap',
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.w),
                child: FormComponent(
                  isNumber: true,
                  isAuth: true,
                  formHeight: 48.h,
                  formWidth: double.infinity,
                  controller: _phoneController,
                  prefixIcon: Icons.phone_outlined,
                  hint: 'No.hp',
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.w),
                child: FormComponent(
                  isAuth: true,
                  isEmail: true,
                  formHeight: 48.h,
                  formWidth: double.infinity,
                  controller: _emailController,
                  prefixIcon: Icons.email_outlined,
                  hint: 'Email',
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.w),
                child: FormComponent(
                  isPassword: true,
                  isAuth: true,
                  formHeight: 48.h,
                  formWidth: double.infinity,
                  controller: _passwordController,
                  prefixIcon: Icons.lock_outline,
                  hint: 'Password',
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.w),
                child: FormComponent(
                  isPassword: true,
                  isAuth: true,
                  formHeight: 48.h,
                  formWidth: double.infinity,
                  controller: _confirmPasswordController,
                  prefixIcon: Icons.lock_outline,
                  hint: 'Konfirmasi Password',
                ),
              ),
              SizedBox(
                height: 76.h,
              ),
              ButtonComponent(
                buttonHeight: 40.h,
                buttonWidth: 240.w,
                onPress: () {},
                textButton: 'DAFTAR',
              ),
              Container(
                padding: EdgeInsets.only(right: 10.w, top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sudah Punya Akun?',
                      style: TextStyle(color: AppColors.text1),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false);
                      },
                      child: const Text(
                        'Masuk',
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
