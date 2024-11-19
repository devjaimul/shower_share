import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';


class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: "Profile details",
          fontSize: 18.sp,

        ),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            Container(
              width: 100.r,
              height: 100.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor.withOpacity(0.5),
                  width: 2.w,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 50.sp,
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Profile Details Container
            Column(
              children: [
                _buildDetailContainer("Full Name", "Daniel Martinez"),
                SizedBox(height: 16.h),
                _buildDetailContainer("Date of Birth", "25/08/2001"),
                SizedBox(height: 16.h),
                _buildDetailContainer("Email", "fazzzil72@gmail.com"),
                SizedBox(height: 16.h),
                _buildDetailContainer(
                    "Address", "Bonsree, Dhaka, Bangladesh"),
              ],
            ),
            SizedBox(height: 30.h),

            // Edit Details Button
            CustomTextButton(
              text: "Edit details",
              onTap: () {
            Get.toNamed(RouteNames.profileEditDetails);
              },

              padding: 14.r,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create profile detail container
  Widget _buildDetailContainer(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextTwo(
          text: label,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black.withOpacity(0.7),
        ),
        SizedBox(height: 5.h,),
        Container(
          width: 350.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.primaryColor.withOpacity(0.5),
              width: 1.0,
            ),
          ),
          child:  CustomTextTwo(
            text: value,
            fontSize: 16.sp,

            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
