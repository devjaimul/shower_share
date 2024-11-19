import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/controllers/host/registration_controller.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/views/widgets/custom_text_field.dart';

class RegistrationScreen extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  Future<void> _pickTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? controller.startTime.value : controller.endTime.value,
    );
    if (picked != null) {
      isStartTime ? controller.setStartTime(picked) : controller.setEndTime(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  CustomTextOne(
          text: 'Registration',
          fontSize: 18.sp,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextTwo(text: 'Upload your shower\'s Picture',),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: controller.pickImage,
              child: Obx(() {
                return Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: controller.pickedImage.value != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.file(
                      controller.pickedImage.value!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                      : const Center(
                    child: Icon(Icons.add, color: AppColors.primaryColor, size: 32),
                  ),
                );
              }),
            ),
            SizedBox(height: 16.h),
            const CustomTextTwo(text: 'Home Name'),

            SizedBox(height: 8.h),

            CustomTextField(
              labelText: 'Home Name',
              controller: TextEditingController(text: controller.homeName.value),
              onChanged: (value) => controller.homeName.value = value,
            ),
            SizedBox(height: 16.h),
            const CustomTextTwo(text: 'Address'), SizedBox(height: 8.h),
            CustomTextField(
              labelText: 'Address',
              controller: TextEditingController(text: controller.address.value),
              onChanged: (value) => controller.address.value = value,
            ),
            SizedBox(height: 16.h),
            const CustomTextTwo(text: 'Details'), SizedBox(height: 8.h),
            CustomTextField(
              labelText: 'Details',
              controller: TextEditingController(text: controller.details.value),
              onChanged: (value) => controller.details.value = value,
              maxLine: 6,
            ),
            SizedBox(height: 16.h),
            const CustomTextTwo(text: 'Price/hour'), SizedBox(height: 8.h),
            CustomTextField(
              labelText: 'Price/hour',
              controller: TextEditingController(text: controller.pricePerHour.value),
              onChanged: (value) => controller.pricePerHour.value = value,
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: const Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.h),
            const CustomTextTwo(text: 'Available service'), SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickTime(context, true),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(

                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Obx(() => Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.access_time_filled,color: AppColors.primaryColor,),
                            SizedBox(width: 5.w,),
                            CustomTextTwo(
                              text: 'Start: ${controller.startTime.value.format(context)}',
                              fontSize: 14.sp,
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                    width: 30.w,
                    child: const CustomTextTwo(text: 'to')),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickTime(context, false),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(

                        border: Border.all(color:AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Obx(() => Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.access_time_filled,color: AppColors.primaryColor,),
                            SizedBox(width: 5.w,),
                            CustomTextTwo(
                              text: 'End: ${controller.endTime.value.format(context)}',
                              fontSize: 14.sp,
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 CustomTextOne(
                  text: 'Add other facilities',
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
                IconButton(
                  onPressed: controller.addFacility,
                  icon:  const Icon(Icons.add, ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Obx(() => Column(
              children: controller.facilities.map((facility) {
                TextEditingController nameController =
                TextEditingController(text: facility['name']);
                TextEditingController priceController =
                TextEditingController(text: facility['price']);
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: 'Facility Name',
                          controller: nameController,
                          onChanged: (value) {
                            facility['name'] = value;
                            controller.facilities.refresh();
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                        width: 80.w,
                        child: CustomTextField(
                          labelText: 'Price',
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            facility['price'] = value;
                            controller.facilities.refresh();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )),

            SizedBox(height: 16.h),

            Row(
              children: [
                const CustomTextTwo(
                  text: 'Time Extension:',
                ),
                SizedBox(width: 8.w),
                SizedBox(
                  width: 80.w,
                  child: CustomTextField(
                    labelText: '\$/hour',
                    controller: TextEditingController(text: controller.timeExtensionPrice.value),
                    onChanged: (value) => controller.timeExtensionPrice.value = value,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),
            CustomTextButton(
              text: 'Submit',
              onTap: () {
                Get.offAllNamed(RouteNames.hostCustomNavBar);
              },
            ),
          ],
        ),
      ),
    );
  }
}
