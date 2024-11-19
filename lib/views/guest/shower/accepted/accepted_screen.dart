import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/requested_card.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_images.dart';
import 'package:shower_share/views/guest/shower/requested/requested_details.dart';

class AcceptedScreen extends StatelessWidget {
  const AcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RequestedCard(
              title: 'Aesthetic Vila',
              imageUrl: AppImages.shower, // Replace with actual image URL
              location: 'Road 5, Banasree.',
              rating: 4.9,
              reviews: '1.7k', date: 'Monday, May 12', time: '11:00 - 12:00 AM',
              leftBtn: 'View Details',
              leftOnTap: () {
                Get.to(const RequestedDetails(
                  isFormAccepted: true,
                  profileImg: AppImages.man,
                  title: 'Aesthetic Vila',
                  imageUrl: AppImages.shower, // Replace with actual image URL
                  hostName: 'Tanimul',
                  location: 'Road 5, Banasree.',
                  price: '\$39',
                  rating: 4.9,
                  reviews: '1.7k',
                ));
              },
              rightBtn: 'Confirm',
              rightOnTap: () {
                Get.toNamed(RouteNames.paymentDetails);
              },

            )
          ],
        ),
      ),
    );
  }
}
