import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/controllers/bottom_sheet_controller.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX Controller
    final BottomSheetController controller = Get.put(BottomSheetController());

    return SingleChildScrollView(  // Make the bottom sheet scrollable
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextOne(
              text: 'Add Other Facilities:',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 10.h),

            // Other facilities checkboxes using GetX for state management
            _facilityCheckbox('Towel Rental', '\$4.50', controller.isTowelRentalChecked),
            _facilityCheckbox('Grooming Kits', '\$4.50', controller.isGroomingKitsChecked),
            _facilityCheckbox('Locker facilities', '\$4.50', controller.isLockerFacilitiesChecked1),
            _facilityCheckbox('Locker facilities', '\$4.50', controller.isLockerFacilitiesChecked2),
            _facilityCheckbox('Locker facilities', '\$4.50', controller.isLockerFacilitiesChecked3),

            SizedBox(height: 20.h),

            // Other facilities price summary using GetX reactive value
            Obx(() {
              return customPriceRow(controller,"Other facilities Price");
            }),
            const Divider(),
            SizedBox(height: 5.h),

            // Shower room booking price - Static price
            customPriceRow(
              controller,
              'Shower room booking Price (2 Hours)',
              staticPrice: 70,
            ),
            SizedBox(height: 5.h),
            const Divider(),
            SizedBox(height: 5.h),

            // Total price using GetX reactive value
            Obx(() {
              return customPriceRow(controller, 'Total Price', staticPrice: 70 + controller.calculatePrice());
            }),
            SizedBox(height: 20.h),

            // Send request button
            CustomTextButton(
              text: 'Send Request',
              onTap: () {
                // Handle the request submission
                Get.offAllNamed(RouteNames.customNavBar);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Custom Price Row Widget with dynamic or static price
  Widget customPriceRow(BottomSheetController controller, String title, {double? staticPrice}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextTwo(
          text: title,
          fontSize: 14.sp,
          color: Colors.black,
        ),
        CustomTextTwo(
          text: '\$${staticPrice ?? controller.calculatePrice()}',
          fontSize: 17.sp,
          color: AppColors.buttonColor,
        ),
      ],
    );
  }

  // Facility Checkbox widget with GetX
  Widget _facilityCheckbox(String name, String price, RxBool isChecked) {
    return Row(
      children: [
        Obx(() {
          return Checkbox(
            activeColor: AppColors.buttonColor,
            value: isChecked.value,
            onChanged: (value) {
              isChecked.value = value!;
            },
          );
        }),

        // Make sure the Row uses expanded space for text and price
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextTwo(
                text: "$name :",
                color: AppColors.blackColor,
                fontSize: 14.sp,
              ),
              CustomTextTwo(
                text: price,
                color: AppColors.blackColor,
                fontSize: 14.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
