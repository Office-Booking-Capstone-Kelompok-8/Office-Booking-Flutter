import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormComponent extends StatelessWidget {
  const FormComponent(
      {super.key,
      required this.formHeight,
      required this.formWidth,
      this.buttonController,
      this.initialValue,
      this.isNumber,
      this.isPassword,
      this.isAuth,
      this.prefixIcon,
      this.hint});

  final double formHeight;
  final double formWidth;
  final TextEditingController? buttonController;
  final String? initialValue;
  final bool? isNumber;
  final bool? isPassword;
  final bool? isAuth;
  final IconData? prefixIcon;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: formHeight,
      width: formWidth,
      child: TextFormField(
        controller: buttonController,
        initialValue: initialValue,
        keyboardType:
            isNumber == true ? TextInputType.number : TextInputType.text,
        obscureText: isPassword!,
        decoration: InputDecoration(
            prefix: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isAuth == true ? 0.w : 2.w, vertical: 11.h)),
            hintText: isAuth == true ? hint : '',
            prefixIcon: isAuth == true
                ? Icon(
                    prefixIcon!,
                    size: 24,
                  )
                : null,
            hintStyle: TextStyle(fontSize: 12.sp),
            suffixIcon: isPassword == true
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      size: 24,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(isAuth == true ? 16.r : 10.r),
            )),
      ),
    );
  }
}
