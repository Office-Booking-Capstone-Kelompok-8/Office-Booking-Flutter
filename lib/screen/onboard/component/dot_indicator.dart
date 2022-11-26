import 'package:flutter/material.dart';

import '../../../utils/constant/app_colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = true}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary4 : const Color(0xFF6CB8F8),
        shape: BoxShape.circle,
      ),
    );
  }
}
