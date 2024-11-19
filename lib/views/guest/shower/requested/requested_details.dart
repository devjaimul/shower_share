import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/custom_details.dart';
import 'package:shower_share/global_widgets/time_picker_box.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/global_widgets/booking_time_row.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

class RequestedDetails extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String profileImg;
  final String hostName;
  final String location;
  final String price;
  final double rating;
  final String reviews;
  final bool? isFormAccepted;

  const RequestedDetails({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.profileImg,
    required this.hostName,
    required this.location,
    required this.price,
    required this.rating,
    required this.reviews,
    this.isFormAccepted,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: 'Booking Details',
          fontSize: 20.sp,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDetails(
              title: title,
              imageUrl: imageUrl,
              profileImg: profileImg,
              hostName: hostName,
              location: location,
              price: price,
              rating: rating,
              reviews: reviews,
            ),
            SizedBox(height: 10.h),
            _buildSectionTitle('Other booking facilities'),
            SizedBox(height: 10.h),
            _buildFacilitiesList(),
            SizedBox(height: 10.h),
            _buildDateAndDurationRow(),
            SizedBox(height: 10.h),
            _buildSectionTitle('Booking Time'),
            BookingTimeRow(),
            SizedBox(height: 20.h),
            isFormAccepted == true
                ? CustomTextButton(
                    text: 'Confirm',
                    onTap: () {
                      Get.toNamed(RouteNames.paymentDetails);
                    },
                  )
                : CustomTextButton(
                    text: 'Cancel',
                    onTap: () {
                      Get.offAllNamed(RouteNames.customNavBar);
                    },
                    color: Colors.red,
                  ),
          ],
        ),
      ),
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String text) {
    return CustomTextOne(
      text: text,
      fontSize: 16.sp,
      color: Colors.black,
    );
  }

  // Facilities List Widget
  Widget _buildFacilitiesList() {
    final facilities = [
      {'name': 'Towel Rental', 'price': '\$4.50'},
      {'name': 'Grooming Kits', 'price': '\$4.50'},
      {'name': 'Locker facilities', 'price': '\$4.50'},
    ];

    return Column(
      children: facilities
          .map((facility) => Column(
                children: [
                  _facilityRow(facility['name']!, facility['price']!),
                  const Divider(),
                ],
              ))
          .toList(),
    );
  }

  // Facility Row Widget
  Widget _facilityRow(String name, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextTwo(
          text: "$name : ",
          color: Colors.black,
        ),
        CustomTextTwo(
          text: price,
          color: Colors.black,
        ),
      ],
    );
  }

  // Date and Duration Row Widget
  Widget _buildDateAndDurationRow() {
    return Row(
      children: [
        Expanded(
          child: _buildColumnWithLabel(
            label: 'Booking Date',
            child: const TimePickerBox(
              text: '22 March',
              color: AppColors.blackColor,
              icon: Icons.calendar_month,
            ),
          ),
        ),
        SizedBox(width: 30.w, child: _buildToText()),
        Expanded(
          child: _buildColumnWithLabel(
            label: 'Booking For',
            child: const TimePickerBox(
              text: '1 Hour',
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }

  // Column with Label Widget
  Widget _buildColumnWithLabel({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextOne(
          text: label,
          fontSize: 16.sp,
          color: Colors.black,
        ),
        SizedBox(height: 5.h),
        child,
      ],
    );
  }

  // "To" Text Widget
  Widget _buildToText() {
    return CustomTextTwo(
      text: "to",
      fontSize: 14.sp,
    );
  }
}
