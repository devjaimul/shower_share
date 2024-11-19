import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/views/guest/home/booking_details_screen.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

class ShowerCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String profileImg;
  final String hostName;
  final String location;
  final String price;
  final double rating;
  final String reviews;

  const ShowerCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.hostName,
    required this.location,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.profileImg,
  });

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;
    return Container(
      width: sizeW * .52,
      margin: EdgeInsets.symmetric(vertical: sizeH * .01),
      padding: EdgeInsets.all(sizeH * .01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image.asset(
              imageUrl,
              height: sizeH * .15,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: sizeH * .008),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomTextTwo(
                text: 'Aesthetic Vila',
                color: AppColors.blackColor,
                fontSize: sizeH*.017,
                fontWeight: FontWeight.w800,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.buttonSecondColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeW * .008, vertical: sizeH * .002),
                  child:  CustomTextTwo(
                    text: '\$39/hour',
                    color: AppColors.primaryColor,
                    fontSize: sizeH*.015,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: sizeH * .006),
          Row(
            children: [
              CircleAvatar(
                radius: 12.r,
                backgroundImage:
                    AssetImage(profileImg), // Replace with your avatar icon
              ),
              SizedBox(width: sizeW * .005),
              CustomTextTwo(
                text: hostName,
                fontWeight: FontWeight.w800,
                fontSize: sizeH * .014,
              ),
              SizedBox(width: sizeW * .005),
              Image.asset(
                AppIcons.verify,
                height: sizeH * .018,
                width: sizeW * .05,
              )
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on, size: sizeH * .02, color: Colors.grey),
              SizedBox(width: sizeW * .005),
              Expanded(
                child: Text(
                  location,
                  style: TextStyle(fontSize: sizeH * .014, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: AppColors.yellowColor, size: sizeH*.014),
              SizedBox(width: sizeW * .003),
              CustomTextTwo(
                text: rating.toString(),
                fontSize: 12.sp,
              ),
              CustomTextTwo(
                text: '($reviews reviews)',
                color: Colors.grey,
                fontSize: sizeH * .014,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Image(
                    image: const AssetImage(
                      AppIcons.chat,
                    ),

                    height: sizeH*.03,
                  ))
            ],
          ),
          SizedBox(
              width: double.infinity,
              child: CustomTextButton(
                text: 'Book Now',
                onTap: () {
                  Get.to(BookingDetailsScreen(title: title, imageUrl: imageUrl, profileImg: profileImg, hostName: hostName, location: location, price: price, rating: rating, reviews: reviews));
                },
                radius: 10.r,
                color: AppColors.primaryColor,
                padding: 0,
                fontSize: sizeH * .016,
              )),
        ],
      ),
    );
  }
}
