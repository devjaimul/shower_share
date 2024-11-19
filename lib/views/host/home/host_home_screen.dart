import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/views/host/host%20widgets/host_custom_details.dart';

class HostHomeScreen extends StatelessWidget {
  const HostHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            icon: Image.asset(
              AppIcons.support,
              height: 20.h,
              width: 20.w,
              color: AppColors.primaryColor,
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
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
          child: const HostCustomDetails(
           ),
        ),
      ),
    );
  }
}
