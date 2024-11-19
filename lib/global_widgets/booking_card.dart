import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';

class BookingCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;
  final String reviews;
  final String date;
  final String time;
  final String location;

  const BookingCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.date,
    required this.time,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.buttonSecondColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Circular image on the left
          CircleAvatar(
            radius: 30.r,
            backgroundImage: AssetImage(imageUrl), // Replace with your avatar icon
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
                    Icon(Icons.star_border, color: Colors.amber, size: 16.sp),
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
                    Icon(Icons.calendar_today, size: 10.sp, ),
                    SizedBox(width: 4.w),
                    CustomTextTwo(
                      text: date,
                      fontSize: 11.sp,
                    ),
                    SizedBox(width: 10.w),
                    Icon(Icons.access_time, size: 10.sp, ),
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
                    Icon(Icons.location_on, size: 14.sp, color: Colors.grey),
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
    );
  }
}
