import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_constant.dart';

import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/views/host/registration/registration_screen.dart';
import 'package:shower_share/views/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  final bool? isHost;
  const SignUpScreen({super.key, this.isHost});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isTermsAccepted = false;

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
                  SizedBox(height: 80.h),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: CustomTextOne(
                        text: 'Create your Account.',
                        color: AppColors.primaryColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const Center(
                    child: CustomTextTwo(
                      text: 'Make sure that your account keep secure.',
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Full Name Field
                  CustomTextTwo(
                    text: 'Full Name',
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    controller: fullNameController,
                    hintText: 'Full Name',
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image(
                        image: const AssetImage(AppIcons.person),
                        height: 15.h,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your full name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),

                  // Email Field
                  CustomTextTwo(
                    text: 'Email Address',
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email Address',
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image(
                          image: const AssetImage(AppIcons.email),
                          height: 15.h),
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
                  SizedBox(height: 10.h),

                  // Password Field
                  CustomTextTwo(
                    text: 'Password',
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image(
                          image: const AssetImage(AppIcons.password),
                          height: 15.h),
                    ),
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
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
                      child: Image(
                          image: const AssetImage(AppIcons.password),
                          height: 15.h),
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
                  SizedBox(height: 10.h),

                  // Terms and Conditions Checkbox
                  Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.primaryColor,
                        value: isTermsAccepted,
                        onChanged: (value) {
                          setState(() {
                            isTermsAccepted = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'I have read & agreed to Shower share ',
                            style: TextStyle(
                                color: AppColors.textColor, fontSize: 12.sp),
                            children: [
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 12.sp,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  // Sign Up Button
                  CustomTextButton(
                    text: 'sign Up',
                    color: AppColors.buttonColor,
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        if (isTermsAccepted) {

                          if(widget.isHost==true){
                            //host navbar
                            Get.to(RegistrationScreen());
                          }
                          else{
                            Get.offAllNamed(RouteNames.customNavBar);
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Please accept the terms and conditions")),
                          );
                        }
                      }
                    },
                  ),
                  SizedBox(height: 10.h),

                  // Sign In Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextTwo(
                        text: 'Already have an account?',
                        color: AppColors.textColor,
                        fontSize: 12.sp,
                      ),
                      StyleTextButton(
                        text: 'Sign In',
                        onTap: () {
                          Get.toNamed(RouteNames.signInScreen);
                        },
                      ),
                    ],
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
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }
}
