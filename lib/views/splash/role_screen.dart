import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/app_logo.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_strings.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/views/splash/select_screen.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

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
          CustomTextButton(text: 'Be a Guest', onTap: (){Get.toNamed(RouteNames.selectScreen);}),
          SizedBox(height: 15.h,),
          CustomTextButton(text: 'Be a Host', onTap: (){Get.to(const SelectScreen(isHost: true,));},color: AppColors.buttonSecondColor,textColor: AppColors.buttonColor,),
        ],
      ),
    ),
  ),
),
    );
  }
}
