import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shower_share/controllers/profile/profile_edit_detail_controller.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/views/widgets/custom_text_field.dart';

class ProfileEditDetails extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final ProfileEditDetailController controller = Get.put(ProfileEditDetailController());

  ProfileEditDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: CustomTextOne(
          text: "Profile details",
          fontSize: 18.sp,

        ),

      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture with Camera Icon
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Obx(() => Container(
                      width: 100.r,
                      height: 100.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          width: 2.w,
                        ),
                        image: controller.selectedImage.value != null
                            ? DecorationImage(
                          image: FileImage(controller.selectedImage.value!),
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                      child: controller.selectedImage.value == null
                          ? CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 50.sp,
                        ),
                      )
                          : null,
                    )),
                    Positioned(
                      bottom: 4.h,
                      right: 4.w,
                      child: GestureDetector(
                        onTap: () => _showImagePickerOptions(context),
                        child: Container(
                          height: 24.r,
                          width: 24.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // Full Name
              CustomTextTwo(
                text: 'Full Name',
                color: Colors.black,
                fontSize: 15.sp,
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: fullNameController,
                hintText: "Full Name",
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your full name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Date of Birth
              CustomTextTwo(
                text: 'Date of Birth',
                color: Colors.black,
                fontSize: 15.sp,
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: dobController,
                hintText: "Date of birth",
                keyboardType: TextInputType.datetime,
                readOnly: true,
                onTap: () => controller.pickDate(context, dobController),
                suffixIcon: const Icon(
                  Icons.calendar_month,
                  color: AppColors.primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select your date of birth";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Email
              CustomTextTwo(
                text: 'Email',
                color: Colors.black,
                fontSize: 15.sp,
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!GetUtils.isEmail(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Address
              CustomTextTwo(
                text: 'Address',
                color: Colors.black,
                fontSize: 15.sp,
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: addressController,
                hintText: "Address",
                keyboardType: TextInputType.streetAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.h),

              // Save Change Button
              CustomTextButton(
                text: "Save Change",
                onTap: () {
                  if (controller.validateForm()) {
                    // Handle save changes action
                    Get.back();
                    Get.snackbar("Success", "Profile updated successfully!");

                  }

                },

              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to show image picker options
  void _showImagePickerOptions(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera, color: AppColors.primaryColor),
              title: const Text("Camera"),
              onTap: () {
                controller.pickImage(ImageSource.camera);
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: AppColors.primaryColor),
              title: const Text("Gallery"),
              onTap: () {
                controller.pickImage(ImageSource.gallery);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
