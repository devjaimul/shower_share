import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_constant.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/utils/app_images.dart';
import 'package:shower_share/utils/app_strings.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/views/guest/auth/otp_verification_screen.dart';
import 'package:shower_share/views/widgets/custom_text_field.dart';

class EmailVerifyScreen extends StatefulWidget {
  final bool? isFormChangePass;
  const EmailVerifyScreen({super.key, this.isFormChangePass});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  final TextEditingController emailTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h,),
                Center(child: Image.asset(AppImages.emailScreen,height: 300.h,width: 300.w,)),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextTwo(
                    text: 'Email Address',
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    controller: emailTEController,
                    hintText: AppString.globalEmail,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image(
                        image: const AssetImage(AppIcons.email),
                        height: 15.h,
                      ),
                    ),
                    isEmail: true,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email address";
                      } else if (!AppConstants.emailValidate.hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextButton(
                    text: 'Get Otp',
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        if(widget.isFormChangePass==true){
                          Get.to(const OtpVerificationScreen(isFormChangePass: true,));
                        }
                        else{
                          Get.toNamed(RouteNames.otpVerificationScreen);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTEController.clear();
  }
}
