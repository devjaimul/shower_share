import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/global_widgets/custom_text.dart';

class CustomDetails extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String profileImg;
  final String hostName;
  final String location;
  final String price;
  final double rating;
  final String reviews;
  const CustomDetails({super.key, required this.title, required this.imageUrl, required this.profileImg, required this.hostName, required this.location, required this.price, required this.rating, required this.reviews});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Column(
      children: [
        // Image of the room
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: DecorationImage(
              image: AssetImage(imageUrl), // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10.h),

        // Room name and rating
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextOne(
              text: title,
              color: Colors.black,
              fontSize: 20.sp,
            ),
            Row(
              children: [
                Icon(Icons.star, color: AppColors.yellowColor, size: sizeH * .014),
                CustomTextTwo(
                  text: rating.toString(),
                ),
                CustomTextTwo(
                  text: '($reviews reviews)',
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage(profileImg),
            ),
            SizedBox(width: sizeW * .025),
            CustomTextTwo(
              text: hostName,
              fontWeight: FontWeight.w800,
            ),
            SizedBox(width: sizeW * .005),
            Image.asset(
              AppIcons.verify,
              height: sizeH * .02,
              width: sizeW * .06,
            )
          ],
        ),
        SizedBox(height: 10.h),
        // Address and description
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: AppColors.primaryColor, size: 16.sp),
                CustomTextTwo(
                  text: location,
                  color: Colors.grey,
                ),
              ],
            ),
            CustomTextTwo(
              text: 'Price: $price/hour',
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomTextTwo(
          text:
          "Typically featuring my shower has a drain, and appropriate waterproof flooring. It may include walls or curtains to prevent water from splashing outside the designated area. Some shower rooms are compact with only the essentials, while others may have additional features like built-in shelves, benches, or mirrors. For rental purposes, it's important to highlight key features such as cleanliness, privacy, and whether the space is shared or private. Ensure the room is well-ventilated to prevent moisture buildup.",
          textAlign: TextAlign.start,
          fontSize: 13.sp,
        ),
      ],
    );
  }
}
