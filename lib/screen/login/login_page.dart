import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                height: 48.h,
                margin: EdgeInsets.all(10.w),
                child: TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 12.sp),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      size: 24.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0xFF0012B0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 48.h,
                margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
                child: TextFormField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 12.sp),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 24.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0xFF0012B0),
                      ),
                    ),
                  ),
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
                            color: Color(0xFF5B5A5A)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                width: 240.w,
                height: 40.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFD9D9D9)),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)))),
                  onPressed: () {},
                  child: Text(
                    'MASUK',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.w, top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Belum punya akun?',
                      style: TextStyle(color: Color(0xFF7D8797)),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF5B5A5A)),
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
