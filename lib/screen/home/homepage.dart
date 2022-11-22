import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/form_component.dart';
import '../components/button_component.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ButtonComponent(
              isMessage: true,
              buttonHeight: 40.h,
              buttonWidth: 240.w,
              onPress: () {},
              textButton: 'Login',
            ),
            SizedBox(
              height: 20.h,
            ),
            FormComponent(
              isPassword: false,
              hint: 'Passowrd',
              isAuth: true,
              prefixIcon: Icons.home,
              formHeight: 48.h,
              formWidth: 328.w,
            )
          ],
        ),
      )),
    );
  }
}
