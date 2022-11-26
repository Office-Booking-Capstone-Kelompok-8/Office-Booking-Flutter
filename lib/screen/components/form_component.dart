import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constant/app_colors.dart';

class FormComponent extends StatelessWidget {
  const FormComponent(
      {super.key,
      required this.formHeight,
      required this.formWidth,
      this.controller,
      this.initialValue,
      this.isNumber,
      this.isPassword,
      this.isAuth,
      this.isEmail,
      this.prefixIcon,
      this.hint,
      this.validation,
      this.isSearch});

  final double formHeight;
  final double formWidth;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? isNumber;
  final bool? isPassword;
  final bool? isAuth;
  final bool? isEmail;
  final bool? isSearch;

  final IconData? prefixIcon;
  final String? hint;
  final String? Function(String? value)? validation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: formHeight,
      width: formWidth,
      child: TextFormField(
        controller: controller,
        validator: (validation != null)
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else if (value.length < 4) {
                  return 'Text must have more than 4 character length';
                }
                return null;
              }
            : validation,
        initialValue: initialValue,
        keyboardType: isNumber == true
            ? TextInputType.number
            : isEmail == true
                ? TextInputType.emailAddress
                : TextInputType.text,
        obscureText: isPassword != null ? isPassword! : false,
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
            border: isSearch == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.borderButton,
                    ),
                  )
                : null),
      ),
    );
  }
}
