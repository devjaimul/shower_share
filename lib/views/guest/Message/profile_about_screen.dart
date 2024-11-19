import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/dialog.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_images.dart';

import '../../../controllers/message/profile_about_controller.dart';

class ProfileAboutScreen extends StatelessWidget {
  final ProfileAboutController controller = Get.put(ProfileAboutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// =======================================>  Profile Picture ====================================>
              CircleAvatar(
                radius: 50.r,
                backgroundImage: const AssetImage(AppImages.model),
              ),
              SizedBox(height: 20.h),

              /// ======================================> Profile Name ======================================>
              CustomTextOne(
                text: 'Jenni Miranda',
                color: Colors.black,
                fontSize: 20.sp,
                maxLine: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 80.h),

              /// ===================================> Media Button =======================================>
              _buildProfileOption(
                  title: 'Media',
                  onTap: () {
                    Get.toNamed(RouteNames.mediaScreen);
                  }),

              _buildProfileOption(
                  title: 'Report',
                  onTap: () {
                    Get.toNamed(RouteNames.reportScreen);
                  }),

              SizedBox(height: 10.h),

              /// =============================================>  Block Button ==========================================>
              _buildProfileOption(
                  title: 'Block',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: 'Are you sure you want to block this Account?',
                        confirmButtonText: "Yes, Block",
                        confirmButtonColor: Colors.red,
                        onCancel: () {
                          // Handle Cancel Button Action
                          Get.back();
                        },
                        onConfirm: () {
                          // Handle Log Out Action
                          Get.offAllNamed(RouteNames.customNavBar);
                        },
                      ),
                    );
                  },
                  color: Colors.red.withOpacity(
                    0.2,
                  ),
                  textColor: Colors.red,
                  noIcon: true),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildProfileOption({
  required String title,
  required VoidCallback onTap,
  Color? color,
  Color? textColor,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomTextOne(
                text: title,
                textAlign: TextAlign.start,
                color: textColor ?? AppColors.textColor,
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
