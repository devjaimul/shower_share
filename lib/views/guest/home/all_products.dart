import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/shower_card.dart';
import 'package:shower_share/utils/app_images.dart';
import 'package:shower_share/global_widgets/custom_text.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final arg = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: arg.toString(),
          fontSize: 16.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.r),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .55,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child:  SizedBox(
                child: ShowerCard(
                  profileImg: AppImages.man,
                  title: 'Aesthetic Vila',
                  imageUrl: AppImages.shower, // Replace with actual image URL
                  hostName: 'Tanimul',
                  location: 'Road 5, Banasree.',
                  price: '\$39',
                  rating: 4.9,
                  reviews: '1.7k',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
