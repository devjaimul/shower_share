import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/app_logo.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: 'Support',
          fontSize: 18.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
              SizedBox(height: 30.h),
              // Support Text
              const CustomTextTwo(
                  text:
                      "Need help? We're here for you! Feel free to reach out if you encounter any issues."),
              SizedBox(height: 30.h),
              // Card for Messaging
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.buttonSecondColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Message Icon
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 30.w,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(height: 10.h),
                      // Message Text
                     const CustomTextTwo(text: 'Message Us'),
                      SizedBox(height: 5.h),
                      // Click here link
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteNames.messageChatScreen);
                        },
                        child: const CustomTextTwo(text: 'Click Here',color: AppColors.primaryColor,)
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100.h),
              const AppLogo(),

            ],
          ),
        ),
      ),
    );
  }
}
