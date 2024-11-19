import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/custom_details.dart';
import 'package:shower_share/global_widgets/review_card.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

import 'booking shedule/schedule.dart';

class BookingDetailsScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String profileImg;
  final String hostName;
  final String location;
  final String price;
  final double rating;
  final String reviews;
  final bool? isFormCancel;
  const BookingDetailsScreen({super.key, required this.title, required this.imageUrl, required this.profileImg, required this.hostName, required this.location, required this.price, required this.rating, required this.reviews, this.isFormCancel});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: 'Booking details',
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CustomDetails(title: title, imageUrl: imageUrl, profileImg: profileImg, hostName: hostName, location: location, price: price, rating: rating, reviews: reviews),
              SizedBox(height: 10.h),

              // Price and Time extension
              CustomTextTwo(
                text: 'Time Extension: \$20/hour',
                fontSize: 14.sp,
                color: Colors.black,
              ),
              SizedBox(height: 10.h),

              // Other facilities
              CustomTextTwo(
                text: 'Other facilities',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _facilityRow('Towel Rental', '\$4.50'),
                      _facilityRow('Grooming Kits', '\$4.50'),
                      _facilityRow('Locker facilities', '\$4.50'),
                    ],
                  ),
                  const VerticalDivider(
                    width: 1,
                    color: Colors.black,
                    thickness: 1,
                    indent: 10, // Space above the divider
                    endIndent: 10, // Space below the divider
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _facilityRow('Towel Rental', '\$4.50'),
                      _facilityRow('Grooming Kits', '\$4.50'),
                      _facilityRow('Locker facilities', '\$4.50'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Reviews Section
              CustomTextTwo(
                text: 'Reviews',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 8.h),
             SizedBox(height: sizeH*.14,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: 10,
               itemBuilder: (context, index) {
               return Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 5.r),
                 child: const ReviewCard(),
               );
             },),
             ),
              SizedBox(height: 16.h),

              // Book Now Button
            isFormCancel==true?  CustomTextButton(
                text: 'Book Again',
                onTap: () {
                 Get.to(const Schedule());
                },

              ): CustomTextButton(
              text: 'Book Now',
              onTap: () {
                Get.to(const Schedule());
              },

            ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _facilityRow(String name, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextTwo(
          text: "$name : ",
          color: Colors.black,
        ),
        SizedBox(width: 5.w),
        CustomTextTwo(
          text: price,
          color: Colors.black,
        ),
      ],
    );
  }


}
