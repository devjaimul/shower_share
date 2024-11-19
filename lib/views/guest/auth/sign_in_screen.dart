import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_constant.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/utils/app_strings.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/views/host/custom_nav_bar/host_custom_nav_bar.dart';
import 'package:shower_share/views/widgets/custom_text_field.dart';


class SignInScreen extends StatefulWidget {
  final bool? isHost;
  const SignInScreen({super.key, this.isHost});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
                    child: CustomTextOne(
                      text: AppString.signInText,
                    ),
                  ),
                  Center(
                    child: CustomTextTwo(
                      text: AppString.signInText2,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
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
                    height: 10.h,
                  ),
                  CustomTextTwo(
                    text: 'Password',
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    controller: passTEController,
                    hintText: AppString.globalPass,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image(
                        image: const AssetImage(AppIcons.password),
                        height: 15.h,
                      ),
                    ),
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (!AppConstants.validatePassword(value)) {
                        return "Password must be at least 6 characters long and contain both letters and numbers";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: StyleTextButton(
                      text: AppString.signInForgetPass,
                      onTap: () {
                        Get.toNamed(RouteNames.emailVerifyScreen);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  CustomTextButton(
                    text: 'Sign In',
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {

                        if(widget.isHost==true){
                          //host navbar
                         Get.offAll(const HostCustomNavBar());
                        }
                        else{
                          Get.offAllNamed(RouteNames.customNavBar);
                        }
                      }
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    CustomTextTwo(text: AppString.signInDoNtHaveAccount,),
                    StyleTextButton(text: AppString.signUp, onTap: (){Get.toNamed(RouteNames.singUpScreen);})
                  ],)
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
    passTEController.clear();

  }
}
