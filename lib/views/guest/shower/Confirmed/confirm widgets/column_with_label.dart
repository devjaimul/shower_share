import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/global_widgets/custom_text.dart';

class ColumnWithLabel extends StatelessWidget {
  final String label;
  final Widget child;

  const ColumnWithLabel({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextOne(
          text: label,
          fontSize: 16.sp,
          color: Colors.black,
        ),
        SizedBox(height: 5.h),
        child,
      ],
    );
  }
}