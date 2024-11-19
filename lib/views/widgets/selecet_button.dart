import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';

class SelectedButton extends StatelessWidget {
  final String text;

  final VoidCallback onTap;

  const SelectedButton({
    super.key,
    required this.text,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: AppColors.buttonSecondColor ,

          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.primaryColor,
            fontWeight:FontWeight.bold
          ),
        ),
      ),
    );
  }
}