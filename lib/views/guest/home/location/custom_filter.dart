import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

import '../../../../controllers/location/filter_controller.dart';
import 'custom_input_filed.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({
    super.key,
    required this.filterController,
  });

  final FilterController filterController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 300.w,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Row(
              children: [
                // Back Button
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 24.sp),
                  onPressed: () {
                    Get.back();
                  },
                ),
                SizedBox(width: 5.w),
                CustomTextOne(
                  text: 'Filter',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Price Range Section
            CustomTextOne(
              text: 'Price Range',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              bottom: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextTwo(
                    text: 'Minimum', fontSize: 12.sp, color: Colors.grey),
                CustomTextTwo(
                    text: 'Maximum', fontSize: 12.sp, color: Colors.grey),
              ],
            ),
            Obx(() {
              return Slider(
                value: filterController.priceRange.value,
                min: 30,
                max: 400,
                divisions: 10,
                activeColor: AppColors.primaryColor,
                onChanged: (value) {
                  filterController.updatePriceRange(value);
                },
              );
            }),
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    controller: filterController.minPriceController,
                    hintText:
                        "\$${filterController.minPrice.value.toStringAsFixed(0)}",
                    onChanged: (value) =>
                        filterController.handlePriceInput(value, true),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomInputField(
                    controller: filterController.maxPriceController,
                    hintText:
                        "\$${filterController.maxPrice.value.toStringAsFixed(0)}",
                    onChanged: (value) =>
                        filterController.handlePriceInput(value, false),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Miles From Me Section
            CustomTextOne(
              text: 'Miles From Me',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              bottom: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextTwo(
                    text: 'Minimum', fontSize: 12.sp, color: Colors.grey),
                CustomTextTwo(
                    text: 'Maximum', fontSize: 12.sp, color: Colors.grey),
              ],
            ),
            Obx(() {
              return Slider(
                value: filterController.milesRange.value,
                min: 0,
                max: 5,
                divisions: 5,
                activeColor: AppColors.primaryColor,
                onChanged: (value) {
                  filterController.updateMilesRange(value);
                },
              );
            }),
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    controller: filterController.minMilesController,
                    hintText:
                        filterController.minMiles.value.toStringAsFixed(0),
                    onChanged: (value) =>
                        filterController.handleMilesInput(value, true),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomInputField(
                    controller: filterController.maxMilesController,
                    hintText:
                        filterController.maxMiles.value.toStringAsFixed(0),
                    onChanged: (value) =>
                        filterController.handleMilesInput(value, false),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Rating Section
            CustomTextOne(
              text: 'Rating',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              bottom: 8.h,
            ),
            Obx(() {
              return Slider(
                value: filterController.rating.value,
                min: 0,
                max: 5,
                divisions: 5,
                activeColor: AppColors.primaryColor,
                onChanged: (value) {
                  filterController.updateRating(value);
                },
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () {
                    return CustomTextTwo(
                        text:
                            "${filterController.rating.value.toStringAsFixed(1)}⭐",
                        fontSize: 12.sp,
                        color: Colors.grey);
                  },
                ),
                CustomTextTwo(
                    text: '5.0⭐', fontSize: 12.sp, color: Colors.grey),
              ],
            ),
            SizedBox(height: 20.h),

            // Apply Button
            Center(
              child: CustomTextButton(
                text: 'Apply',
                onTap: () {
                  // Apply Filter Logic
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


