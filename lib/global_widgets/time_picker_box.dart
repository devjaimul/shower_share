
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';

class TimePickerBox extends StatelessWidget {
  final String text;
  final Color? color;
  final IconData? icon;
  const TimePickerBox({super.key, required this.text, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 10.w),

      decoration: BoxDecoration(
        color: AppColors.buttonSecondColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.fromBorderSide(BorderSide(color:AppColors.primaryColor.withOpacity(0.5)))
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(icon??Icons.access_time, color: AppColors.primaryColor),
            SizedBox(width: 5.w,),
            CustomTextTwo(
              text: text,
              fontSize: 14.sp,
              color:color?? AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}