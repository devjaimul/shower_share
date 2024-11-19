import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/controllers/home/schedule_controller.dart';
import 'package:shower_share/global_widgets/custom_bottom_sheet.dart';
import 'package:shower_share/global_widgets/time_picker_box.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

class ScheduleBooking extends StatelessWidget {
  const ScheduleBooking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScheduleController controller = Get.put(ScheduleController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),

          // Available time section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextOne(
                text: "Available:",
                fontSize: 18.sp,
              ),
              const TimePickerBox(text: '8:00 AM', color: AppColors.primaryColor),
              CustomTextTwo(
                text: "to",
                fontSize: 14.sp,
              ),
              const TimePickerBox(text: '7:00 AM', color: AppColors.primaryColor),
            ],
          ),
          SizedBox(height: 20.h),

          // Date Picker
          CustomTextTwo(
            text: "Date",
            fontSize: 14.sp,
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () => controller.pickDate(context),
            child: Obx(() {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextTwo(
                      text: controller.selectedDate.value == null
                          ? "Select a date"
                          : "${controller.selectedDate.value!.day}-${controller.selectedDate.value!.month}-${controller.selectedDate.value!.year}",
                      fontSize: 14.sp,
                      color: AppColors.blackColor,
                    ),
                    const Icon(Icons.calendar_today, color: AppColors.primaryColor),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 20.h),

          // Booking Time Section
          CustomTextTwo(
            text: "Booking Time",
            fontSize: 14.sp,
            color: AppColors.textColor,
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => controller.pickTime(context, isStartTime: true),
                child: Obx(() {
                  return TimePickerBox(
                    text: controller.selectedStartTime.value == null
                        ? "Start Time"
                        : controller.selectedStartTime.value!.format(context),
                  );
                }),
              ),
              CustomTextTwo(
                text: "to",
                fontSize: 14.sp,
              ),
              GestureDetector(
                onTap: () => controller.pickTime(context, isStartTime: false),
                child: Obx(() {
                  return TimePickerBox(
                    text: controller.selectedEndTime.value == null
                        ? "End Time"
                        : controller.selectedEndTime.value!.format(context),
                  );
                }),
              ),
            ],
          ),
          const Spacer(),
          CustomTextButton(
            text: 'Next',
            onTap: () => _showBottomSheet(context),
          ),
        ],
      ),
    );
  }

  // Function to show the bottom sheet
  void _showBottomSheet(BuildContext context) async {
    // Use await here if you need the result from the bottom sheet
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensures the sheet height is controlled by content
      builder: (context) {
        return const CustomBottomSheet(); // Use the CustomBottomSheet widget here
      },
    );
  }
}
