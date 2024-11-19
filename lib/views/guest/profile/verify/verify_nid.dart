import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/controllers/profile/verify_nid_controller.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

class VerifyNid extends StatelessWidget {
  final VerifyNidController controller = Get.put(VerifyNidController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(text: 'Upload Your NID Picture',fontSize: 18.sp,maxLine: 1,),
     
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              // Upload Front Side Picture
              Obx(() => _buildUploadBox(
                label: "Upload front side Picture here",
                imagePath: controller.frontImagePath.value,
                onTap: () => controller.pickImage(isFront: true),
              )),
              SizedBox(height: 20.h),
              // Upload Back Side Picture
              Obx(() => _buildUploadBox(
                label: "Upload back side Picture here",
                imagePath: controller.backImagePath.value,
                onTap: () => controller.pickImage(isFront: false),
              )),
              SizedBox(height: 30.h),
              // Submit Button
              CustomTextButton(text: 'Submit', onTap: (){
                if (controller.frontImagePath.value.isEmpty ||
                    controller.backImagePath.value.isEmpty) {
                  Get.snackbar(
                    "!!!",
                    "Please upload both front and back side pictures",

                  );
                } else {
                  // Submit Action
                  Get.back(result: 'verified');
                  Get.snackbar(
                    "Success",
                    "NID pictures uploaded successfully",

                  );

                }
              })
            ],
          ),
        ),
      ),
    );
  }

  // Upload Box Widget
  Widget _buildUploadBox({
    required String label,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: AppColors.buttonSecondColor,
          border: Border.all(color:  AppColors.primaryColor.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: imagePath.isEmpty
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 30.sp, color:  AppColors.primaryColor),
            SizedBox(height: 10.h),
          CustomTextTwo(text: label,color: AppColors.primaryColor,)
          ],
        )
            : ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.file(
            File(imagePath),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
