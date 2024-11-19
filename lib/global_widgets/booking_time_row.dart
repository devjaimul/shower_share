import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/global_widgets/time_picker_box.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';

class BookingTimeRow extends StatelessWidget {
  const BookingTimeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TimePickerBox(
            text: '8:00 AM',
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(width: 30.w, child: CustomTextTwo(text: "to", fontSize: 14.sp)),
        const Expanded(
          child: TimePickerBox(
            text: '7:00 AM',
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}