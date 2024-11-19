import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/controllers/shower/confirm_details_controller.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

class TimeExtensionSection extends StatelessWidget {
  final ConfirmDetailsController controller;

  const TimeExtensionSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextTwo(
              text: 'Time Extension: \$20/hour',
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomTextTwo(
                text: 'Extra Time Needed:',
                fontSize: 13.sp,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Obx(() {
                  return DropdownButton<double>(
                    value: controller.extraTime.value,
                    underline: const SizedBox.shrink(),
                    items: [0.5, 1.0, 1.5, 2.0]
                        .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.toString()),
                    ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) controller.updateExtraTime(value);
                    },
                  );
                }),
              ),
            ),
            Expanded(
              child: Obx(() {
                return CustomTextTwo(
                  text: 'Price: \$${controller.calculatedPrice.value.toStringAsFixed(2)}',
                  fontSize: 13.sp,
                  color: Colors.black,
                  textAlign: TextAlign.end,
                );
              }),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        CustomTextButton(
          text: 'Send Extension Request',
          onTap: () {
            // Handle Time Extension Request
          },
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}