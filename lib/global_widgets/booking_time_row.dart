import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/global_widgets/time_picker_box.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';

class BookingTimeRow extends StatelessWidget {
  const BookingTimeRow({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Row(
      children: [
        const Expanded(
          child: TimePickerBox(
            text: '8:00 AM',
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(width: sizeW*.2, child: CustomTextTwo(text: "to", fontSize: sizeH*.014)),
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