import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/utils/app_constant.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/utils/app_strings.dart';
import 'package:shower_share/views/guest/auth/email_verify_screen.dart';
import 'package:shower_share/views/widgets/custom_text_field.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
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
              key:formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Align(
                    alignment: Alignment.center,
                    child: CustomTextOne(
                      text: 'Change Password',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: CustomTextTwo(
                      text: 'Password must have 8 Characters',
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //current password
                  CustomTextTwo(
                    text: 'Current Password',
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    controller: currentPasswordController,
                    hintText: 'Current Password',
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image(image: const AssetImage(AppIcons.password), height: 15.h),
                    ),
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Current password";
                      } else if (!AppConstants.validatePassword(value)) {
                        return "Password must be at least 6 characters long\n and contain both letters and numbers";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  // Password Field
                  CustomTextTwo(
                    text: 'New Password',
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'New Password',
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image(image: const AssetImage(AppIcons.password), height: 15.h),
                    ),
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your new password";
                      } else if (!AppConstants.validatePassword(value)) {
                        return "Password must be at least 6 characters long\n and contain both letters and numbers";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),

                  // Confirm Password Field
                  CustomTextTwo(
                    text: 'Confirm Password',
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image(image: const AssetImage(AppIcons.password), height: 15.h),
                    ),
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your password";
                      } else if (value != passwordController.text) {
                        return "Passwords do not match";
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
                        Get.to(const EmailVerifyScreen(isFormChangePass: true,));
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextButton(
                    text: 'Update Password',
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        Get.back();
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
}
