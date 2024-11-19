import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

class RequestedCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;
  final String reviews;
  final String date;
  final String time;
  final String location;
  final String leftBtn;
  final Function leftOnTap;
  final Function rightOnTap;
  final String rightBtn;
  final Color? lfBtnColor;
  const RequestedCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.rating,
      required this.reviews,
      required this.date,
      required this.time,
      required this.location, required this.leftBtn, required this.rightBtn, required this.leftOnTap, required this.rightOnTap, this.lfBtnColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.all(16.r),
        child: Column(
          children: [
            Row(
              children: [
                // Circular image on the left
                CircleAvatar(
                  radius: 30.r,
                  backgroundImage:
                  AssetImage(imageUrl), // Replace with your avatar icon
                ),
                SizedBox(width: 12.w),
                // Information section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      CustomTextOne(
                        text: title,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      SizedBox(height: 4.h),
                      // Rating row
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          Icon(Icons.star_border,
                              color: Colors.amber, size: 16.sp),
                          SizedBox(width: 4.w),
                          CustomTextTwo(
                            text: "($rating)",
                            color: AppColors.primaryColor,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      // Date and Time
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 10.sp,
                          ),
                          SizedBox(width: 4.w),
                          CustomTextTwo(
                            text: date,
                            fontSize: 11.sp,
                          ),
                          SizedBox(width: 10.w),
                          Icon(
                            Icons.access_time,
                            size: 10.sp,
                          ),
                          SizedBox(width: 4.w),
                          CustomTextTwo(
                            text: time,
                            fontSize: 10.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      // Location
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 14.sp, color: Colors.grey),
                          SizedBox(width: 4.w),
                          CustomTextTwo(
                            text: location,
                            color: Colors.grey,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextButton(
                      text: leftBtn,
                      onTap: () {leftOnTap();},
                      color: Colors.transparent,
                      borderColor: AppColors.buttonColor,
                      textColor: AppColors.buttonColor,
                      padding: 5.r,
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                    child: CustomTextButton(
                      text: rightBtn,
                      onTap: () {rightOnTap();},
                     color: lfBtnColor,
                      padding: 5.r,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
