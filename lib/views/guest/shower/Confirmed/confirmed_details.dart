import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/controllers/shower/confirm_details_controller.dart';
import 'package:shower_share/global_widgets/custom_details.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';

import '../../../../global_widgets/booking_time_row.dart';
import 'confirm widgets/date_duration_row.dart';
import 'confirm widgets/time_extension_section.dart';


class ConfirmedDetails extends StatelessWidget {
  final ConfirmDetailsController controller =
      Get.put(ConfirmDetailsController());

  final String title;
  final String imageUrl;
  final String profileImg;
  final String hostName;
  final String location;
  final String price;
  final double rating;
  final String reviews;

  ConfirmedDetails({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.profileImg,
    required this.hostName,
    required this.location,
    required this.price,
    required this.rating,
    required this.reviews,
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
            const SectionTitle(title: 'Other booking facilities'),
            SizedBox(height: 10.h),
            FacilitiesList(),
            SizedBox(height: 10.h),
            const DateAndDurationRow(),
            SizedBox(height: 10.h),
            const SectionTitle(title: 'Booking Time'),
            const BookingTimeRow(),
            SizedBox(height: 20.h),
            TimeExtensionSection(controller: controller),
            SizedBox(height: 20.h),
            CustomTextButton(
              text: 'Chat',
              onTap: () {
                Get.toNamed(RouteNames.messageChatScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomTextOne(
      text: title,
      fontSize: 16.sp,
      color: Colors.black,
    );
  }
}

class FacilitiesList extends StatelessWidget {
  final List<Map<String, String>> facilities = [
    {'name': 'Towel Rental', 'price': '\$4.50'},
    {'name': 'Grooming Kits', 'price': '\$4.50'},
    {'name': 'Locker facilities', 'price': '\$4.50'},
  ];

   FacilitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: facilities
          .map((facility) => Column(
                children: [
                  FacilityRow(
                      name: facility['name']!, price: facility['price']!),
                  const Divider(),
                ],
              ))
          .toList(),
    );
  }
}

class FacilityRow extends StatelessWidget {
  final String name;
  final String price;

  const FacilityRow({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
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
}
