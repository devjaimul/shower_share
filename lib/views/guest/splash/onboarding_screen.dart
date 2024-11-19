import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_images.dart';
import 'package:shower_share/utils/app_strings.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView(
  child: Padding(
    padding:  EdgeInsets.symmetric(horizontal: 15.w),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 150.h,),
          Image.asset(AppImages.onBoarding,height: 200.h,width: 300.w,),
          SizedBox(height: 30.h,),
          CustomTextOne(text: AppString.onBoarding,),
          SizedBox(height: 20.h,),
          CustomTextTwo(text: AppString.onBoarding2,),
          SizedBox(height: 30.h,),
          CustomTextButton(text: 'Get Started', onTap: (){Get.offAllNamed(RouteNames.roleScreen);})

        ],
      ),
    ),
  ),
),
    );
  }
}
