import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_images.dart';
import 'package:shower_share/global_widgets/custom_text.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.5)),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          // Profile Image
          CircleAvatar(
            radius: 30.r,
            backgroundImage: const AssetImage(AppImages.man), // Replace with actual image asset or URL
          ),
          SizedBox(width: sizeW * 0.03),
          // Review Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Reviewer Name and Stars
                Row(
                  children: [
                    CustomTextOne(
                      text: 'Cameron Williamson',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5.w),

                  ],
                ),
                Row(children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 14.sp,
                      );
                    }),
                  ),
                  SizedBox(width: 10.w),
                  CustomTextTwo(
                    text: '2 mins ago',
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ],),
                SizedBox(height: 5.h),
                // Review Content
                CustomTextTwo(
                  text: 'It was so fresh & clean',
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
