import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/controllers/profile/profile_screen_controller.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/views/guest/profile/verify/verify_nid.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/global_widgets/dialog.dart';

class ProfileScreen extends StatelessWidget {
  final bool? isHost;
  ProfileScreen({super.key, this.isHost});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              children: [
                // Profile Picture and Name Section
                Center(
                  child: Column(
                    children: [
                      // Profile Picture with Outer Border and Shadow
                      Container(
                        width: 120.r,
                        height: 120.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 10.r,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          border: Border.all(
                            color: AppColors.primaryColor.withOpacity(0.5), // Outer blue border
                            width: 2.w,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundColor: Colors.grey[300],
                          child: Image.asset(
                            AppIcons.person, // Your person icon
                            height: 50.h,
                            width: 50.w,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Profile Name with Verified Icon
                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextOne(
                            text: 'Daniel Martinez',
                            color: Colors.black,
                            fontSize: 20.sp,
                          ),
                          if (profileController.isVerified.value) ...[
                            SizedBox(width: 5.w),
                           Image.asset(AppIcons.verify,height: 20.h,width: 20.w,),
                          ],
                        ],
                      )),
                      SizedBox(height: 10.h),
                      // Verify Profile Button
                      Obx(() {
                        if (profileController.isVerified.value) {
                          return const SizedBox.shrink();
                        }
                        return SizedBox(
                          width: 200.w,
                          child: CustomTextButton(
                            padding: 8.r,
                            text: 'Verify your profile',
                            onTap: () async {
                              final result = await Get.to(VerifyNid());
                              if (result == 'verified') {
                                profileController.setVerified(true);
                              }
                            },
                            color: AppColors.primaryColor,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                // List of Options
                Column(
                  children: [
                    _buildProfileOption(
                      iconPath: AppIcons.person,
                      title: "Profile details",
                      onTap: () {
                        Get.toNamed(RouteNames.profileDetailsScreen);
                      },
                    ),
                    isHost == true
                        ? _buildProfileOption(
                      iconPath: AppIcons.wallet,
                      title: "Wallet",
                      onTap: () {
                        Get.toNamed(RouteNames.walletScreen);
                      },
                    )
                        : null,
                    _buildProfileOption(
                      iconPath: AppIcons.switching,
                      title:isHost==true? "Switch to Guest":"Switch to Host",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            title: "Are You Sure want to be a host?",
                            cancelButtonText: 'No',
                            confirmButtonText: 'Yes',
                            onCancel: () {
                              Get.back();
                            },
                            onConfirm: () {
                              Get.offAllNamed(RouteNames.roleScreen);
                            },
                          ),
                        );
                      },
                    ),
                    _buildProfileOption(
                      iconPath: AppIcons.setting,
                      title: "Settings",
                      onTap: () {
                        Get.toNamed(RouteNames.settingScreen);
                      },
                    ),
                    _buildProfileOption(
                      iconPath: AppIcons.support,
                      title: "Support",
                      onTap: () {
                        Get.toNamed(RouteNames.supportScreen);
                      },
                    ),
                  ].whereType<Widget>().toList(),
                ),

                SizedBox(height: 20.h),

                // Log Out Button
                _buildProfileOption(
                  iconPath: AppIcons.logOut,
                  title: "Log Out",
                  color: AppColors.yellowColor.withOpacity(0.5),
                  noIcon: true,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: "Do you want to log out your profile?",
                        onCancel: () {
                          // Handle Cancel Button Action
                          Get.back();
                        },
                        onConfirm: () {
                          // Handle Log Out Action
                          Get.offAllNamed(RouteNames.roleScreen);
                        },
                      ),
                    );

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget for Profile Option
  Widget _buildProfileOption({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
    Color? color,
    bool? noIcon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: color ?? AppColors.buttonSecondColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(iconPath, height: 20.h, width: 20.w),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomTextOne(
                  text: title,
                  textAlign: TextAlign.start,
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                ),
              ),
              if (noIcon != true)
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.h,
                  color: Colors.grey,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
