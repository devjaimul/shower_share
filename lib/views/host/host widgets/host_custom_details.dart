import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/time_picker_box.dart';
import 'package:shower_share/utils/app_images.dart';

class HostCustomDetails extends StatefulWidget {


  const HostCustomDetails({
    super.key,
  });

  @override
  State<HostCustomDetails> createState() => _HostCustomDetailsState();
}

class _HostCustomDetailsState extends State<HostCustomDetails> {
  bool isAvailable = true; // Initial availability state

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image of the room
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: const DecorationImage(
              image: AssetImage(AppImages.shower), // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10.h),

        // Room name
        CustomTextOne(
          text:'Aesthetic Vila',
          color: Colors.black,
          fontSize: 20.sp,
        ),

        SizedBox(height: 10.h),

        // Address and description
        Row(
          children: [
            Icon(Icons.location_on, color: AppColors.primaryColor, size: 16.sp),
            const CustomTextTwo(
              text: 'Road 5, Banasree.',
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(height: 10.h),

        // Availability and Booking Time
        Row(
          children: [
            Switch(
              value: isAvailable,
              onChanged: (bool value) {
                setState(() {
                  isAvailable = value;
                });
              },
              activeColor: AppColors.primaryColor,
            ),
            SizedBox(width: 10.w),
            CustomTextTwo(
              text: isAvailable ? "Available:" : "Not Available",
              fontSize: sizeH*.015,
              color: isAvailable ? Colors.black : Colors.grey,
            ),
            SizedBox(width: 10.w),
            const Expanded(
              child: TimePickerBox(
                text: '8:00 AM',
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(width: sizeW*.05, child: CustomTextTwo(text: "to", fontSize: sizeH*.013)),
            const Expanded(
              child: TimePickerBox(
                text: '7:00 PM',
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),

        // Room description
        CustomTextTwo(
          text:
          "Typically featuring my shower has a drain, and appropriate waterproof flooring. It may include walls or curtains to prevent water from splashing outside the designated area. Some shower rooms are compact with only the essentials, while others may have additional features like built-in shelves, benches, or mirrors. For rental purposes, it's important to highlight key features such as cleanliness, privacy, and whether the space is shared or private. Ensure the room is well-ventilated to prevent moisture buildup.",
          textAlign: TextAlign.start,
          fontSize: 13.sp,
        ),
        SizedBox(height: 10.h),

        // Pricing
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextTwo(
              text: 'Price: ${'\$39'}/hour',
              fontSize: 16.sp,
              color: Colors.black,
            ),
            CustomTextTwo(
              text: 'Time Extension: \$20/hour',
              fontSize: 13.sp,
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(height: 10.h),

        // Other facilities
        CustomTextTwo(
          text: 'Other facilities',
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _facilityRow('Towel Rental', '\$4.50'),
                _facilityRow('Grooming Kits', '\$4.50'),
                _facilityRow('Locker facilities', '\$4.50'),
              ],
            ),
            const VerticalDivider(
              width: 1,
              color: Colors.black,
              thickness: 1,
              indent: 10, // Space above the divider
              endIndent: 10, // Space below the divider
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _facilityRow('Towel Rental', '\$4.50'),
                _facilityRow('Grooming Kits', '\$4.50'),
                _facilityRow('Locker facilities', '\$4.50'),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.h),
        CustomTextButton(text: 'Edit', onTap: (){},color: AppColors.primaryColor,),
        SizedBox(height: 8.h),
        CustomTextButton(text: 'See Review', onTap: (){},),
      ],
    );
  }

  Widget _facilityRow(String name, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextTwo(
          text: "$name : ",
          color: Colors.black,
        ),
        SizedBox(width: 5.w),
        CustomTextTwo(
          text: price,
          color: Colors.black,
        ),
      ],
    );
  }
}
