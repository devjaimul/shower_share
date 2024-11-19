import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_images.dart';
import 'package:shower_share/utils/app_strings.dart';
import 'package:shower_share/views/guest/auth/reset_pass_screen.dart';
import 'package:shower_share/views/widgets/custom_pin_code_textfiled.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

class OtpVerificationScreen extends StatelessWidget {
  final bool? isFormChangePass;
  const OtpVerificationScreen({super.key, this.isFormChangePass});

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpTEController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                AppImages.otpScreen,
                height: 280.h,
                width: 300.w,
              )),
              const CustomTextOne(
                text: 'Enter Verify OTP code',
              ),
              SizedBox(
                height: 10.h,
              ),
              const CustomTextTwo(
                text: 'Code has been send to jane@gmail.com',
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomPinCodeTextField(
                textEditingController: otpTEController,
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextTwo(
                    text: AppString.otpDidNtGetCode,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextTwo(
                    text: '00.29',
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                      width: 100.w,
                      child: CustomTextButton(
                        borderColor: AppColors.primaryColor,
                        text: 'Resent code',
                        onTap: () {},
                        color: AppColors.buttonSecondColor,
                        textColor: AppColors.primaryColor,
                        fontSize: 12.sp,
                      )),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextButton(
                text: 'Verify',
                onTap: () {

                  if(isFormChangePass==true){
                    Get.to(const ResetPassScreen(isFormChangePass: true,));
                  }
                  else{
                    Get.toNamed(RouteNames.resetPassScreen);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
