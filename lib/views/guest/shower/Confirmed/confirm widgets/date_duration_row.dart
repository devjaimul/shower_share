import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/global_widgets/time_picker_box.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';


import 'column_with_label.dart';

class DateAndDurationRow extends StatelessWidget {
  const DateAndDurationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: ColumnWithLabel(
            label: 'Booking Date',
            child: TimePickerBox(
              text: '22 March',
              color: AppColors.blackColor,
              icon: Icons.calendar_month,
            ),
          ),
        ),
        SizedBox(width: 30.w, child: CustomTextTwo(text: "to", fontSize: 14.sp)),
        const Expanded(
          child: ColumnWithLabel(
            label: 'Booking For',
            child: TimePickerBox(
              text: '1 Hour',
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}