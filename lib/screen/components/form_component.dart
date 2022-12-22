import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constant/app_colors.dart';

// ignore: must_be_immutable
class FormComponent extends StatelessWidget {
  FormComponent(
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
      this.isSearch,
      this.onPress,
      this.isForm,
      this.isProfile,
      this.isDisable});

  final double formHeight;
  final double formWidth;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? isNumber;
  final bool? isPassword;
  final bool? isAuth;
  final bool? isEmail;
  final bool? isSearch;
  final bool? isForm;
  final bool? isProfile;
  final bool? isDisable;
  ValueNotifier<bool> showPassword = ValueNotifier<bool>(true);

  final IconData? prefixIcon;
  final String? hint;
  final String? Function(String? value)? validation;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: showPassword,
        builder: (context, value, _) {
          return SizedBox(
            // height: formHeight,
            // width: formWidth,
            child: TextFormField(
              onTap: onPress,
              controller: controller,
              validator: validation,
              initialValue: initialValue,
              enabled: isDisable == true ? false : true,
              readOnly: isSearch == true ? true : false,
              keyboardType: isNumber == true
                  ? TextInputType.number
                  : isEmail == true
                      ? TextInputType.emailAddress
                      : TextInputType.text,
              obscureText: isPassword == true ? value : false,
              decoration: InputDecoration(
                  contentPadding:
                      isForm == true ? EdgeInsets.only(left: 16.w) : null,
                  prefix: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isAuth == true ? 0.w : 0.w,
                          vertical: 0.h)),
                  hintText:
                      isAuth == true || isProfile == true || isForm == true
                          ? hint
                          : isSearch == true
                              ? 'Filter Building'
                              : '',
                  prefixIcon: isAuth == true
                      ? Icon(
                          prefixIcon!,
                          size: 24,
                        )
                      : null,
                  hintStyle: TextStyle(fontSize: 12.sp),
                  suffixIcon: isPassword == true && value == true
                      ? IconButton(
                          onPressed: () {
                            showPassword.value = !value;
                          },
                          icon: const Icon(
                            Icons.visibility_outlined,
                            size: 24,
                          ),
                        )
                      : isPassword == true && value == false
                          ? IconButton(
                              onPressed: () {
                                showPassword.value = !value;
                              },
                              icon: const Icon(
                                Icons.visibility_off_outlined,
                                size: 24,
                              ),
                            )
                          : isSearch == true
                              ? const Icon(Icons.filter_list)
                              : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.r),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.borderButton,
                    ),
                  ),
                  isDense: true),
            ),
          );
        });
  }
}
