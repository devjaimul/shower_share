import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/app_logo.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_strings.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 220.h,),
                const AppLogo(),
                SizedBox(height: 30.h,),
                CustomTextOne(text: AppString.welcomeText,),
                SizedBox(height: 40.h,),
                CustomTextButton(text: 'Sign In', onTap: (){Get.offAllNamed(RouteNames.signInScreen);}),
                SizedBox(height: 15.h,),
                CustomTextButton(text: 'Sign Up', onTap: (){Get.offAllNamed(RouteNames.singUpScreen);},color: AppColors.buttonSecondColor,textColor: AppColors.buttonColor,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
