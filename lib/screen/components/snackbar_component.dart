import 'package:flutter/material.dart';

import '../../utils/constant/app_colors.dart';

void showNotification(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.primary4, content: Text(message.toString())));
}
