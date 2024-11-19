import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/shower_card.dart';
import 'package:shower_share/global_widgets/weekly_date.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/utils/app_images.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/views/widgets/selecet_button.dart';

import 'all_products.dart';
import 'location/location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextTwo(
                text: "Welcome Back!",
                color: AppColors.yellowColor,
              ),
              CustomTextOne(
                text: "Daniel Martinez",
                maxLine: 1,
                fontSize: 16.sp,
                textOverflow: TextOverflow.ellipsis,
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(LocationScreen());
              },
              icon: Image.asset(
                AppIcons.search,
                height: 20.h,
                width: 20.w,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(RouteNames.notificationScreen);
              },
              icon: Image.asset(
                AppIcons.notification,
                height: 20.h,
                width: 20.w,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextOne(
                    text: 'Popular Shower',
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                  ),
                  SelectedButton(text: 'See All', onTap: () {Get.to(const AllProducts(),arguments: 'Popular Shower');}),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: sizeH * .4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: const ShowerCard(
                        profileImg: AppImages.man,
                        title: 'Aesthetic Vila',
                        imageUrl:
                            AppImages.shower, // Replace with actual image URL
                        hostName: 'Tanimul',
                        location: 'Road 5, Banasree.',
                        price: '\$39',
                        rating: 4.9,
                        reviews: '1.7k',
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
             SizedBox(height: sizeH * .32, child: const WeeklyDate()),

              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextOne(
                    text: 'Near Me',
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                  ),
                  SelectedButton(text: 'See All', onTap: () {Get.to(const AllProducts(),arguments: 'Near Me');}),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: sizeH * .4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: const ShowerCard(
                        profileImg: AppImages.man,
                        title: 'Aesthetic Vila',
                        imageUrl:
                            AppImages.shower, // Replace with actual image URL
                        hostName: 'Tanimul',
                        location: 'Road 5, Banasree.',
                        price: '\$39',
                        rating: 4.9,
                        reviews: '1.7k',
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ));
  }
}
