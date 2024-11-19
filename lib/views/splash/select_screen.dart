import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/app_logo.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_strings.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/views/guest/auth/sign_in_screen.dart';
import 'package:shower_share/views/guest/auth/sign_up_screen.dart';

class SelectScreen extends StatelessWidget {
  final bool? isHost;
  const SelectScreen({super.key, this.isHost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 220.h,
                ),
                const AppLogo(),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextOne(
                  text: AppString.welcomeText,
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextButton(
                    text: 'Sign In',
                    onTap: () {
                      if (isHost == true) {
                        Get.offAll(const SignInScreen(
                          isHost: true,
                        ));
                      } else {
                        Get.offAllNamed(RouteNames.signInScreen);
                      }
                    }),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextButton(
                  text: 'Sign Up',
                  onTap: () {
                    if (isHost == true) {
                      Get.offAll(const SignUpScreen(
                        isHost: true,
                      ));
                    } else {
                      Get.offAllNamed(RouteNames.singUpScreen);
                    }

                  },
                  color: AppColors.buttonSecondColor,
                  textColor: AppColors.buttonColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
