import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/utils/app_images.dart';

class HostRequestedScreen extends StatelessWidget {
  const HostRequestedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Replace with dynamic count
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      itemBuilder: (context, index) {
        return _bookingCard(
          name: index == 0 ? 'Daniel Martinez' : 'Aliya Joli',
          date: 'Monday, May 12',
          time: '11:00 - 12:00 AM',
          duration: index == 2 ? 'Extension Request' : 'For: 1 Hour',
          onAccept: () {},
          onCancel: () => _showCancelDialog(context), // Call the dialog function here
          imageUrl: AppImages.model, // Replace with actual image asset
        );
      },
    );
  }

  Widget _bookingCard({
    required String name,
    required String date,
    required String time,
    required String duration,
    required VoidCallback onAccept,
    required VoidCallback onCancel,
    required String imageUrl,
  }) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: EdgeInsets.only(bottom: 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // User Image
            Center(
              child: CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage(imageUrl),
              ),
            ),
            SizedBox(width: 10.w),
            // Booking Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomTextOne(
                        text: name,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        maxLine: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 5.w),
                      Image.asset(
                        AppIcons.verify,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, size: 12.sp),
                      SizedBox(width: 5.w),
                      CustomTextOne(
                        text: date,
                        fontSize: 12.sp,
                        color: AppColors.textColor,
                        maxLine: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 12.sp),
                      SizedBox(width: 5.w),
                      CustomTextOne(
                        text: time,
                        fontSize: 12.sp,
                        color: AppColors.textColor,
                        maxLine: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  CustomTextOne(
                    text: duration,
                    fontSize: 12.sp,
                    color: AppColors.textColor,
                    maxLine: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  // Accept and Cancel Buttons
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          text: 'Accept',
                          onTap: onAccept,
                          padding: 2.r,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomTextButton(
                          text: 'Cancel',
                          onTap: onCancel,
                          padding: 2.r,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          contentPadding: EdgeInsets.all(20.w),
          content: SizedBox(
            width: 300.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Dialog Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextOne(
                      text: 'Excuse Cancellation',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close, color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                // Text Input Area
                TextField(
                  maxLines: 6,
                  maxLength: 180,
                  decoration: InputDecoration(
                    hintText: 'Sorry, I am not free at this time.',
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(color: AppColors.primaryColor),
                    ),
                    contentPadding: EdgeInsets.all(10.w),
                  ),
                ),
                SizedBox(height: 20.h),
                // Send Button
                CustomTextButton(
                  text: 'Send',

                  onTap: () {
                  Get.back();
                  },

                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
