import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/utils/app_images.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: 'customer Review',
          fontSize: 18.sp,

        ),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall Rating Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Rating Breakdown
                  Column(
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Row(
                          children: [
                            CustomTextOne(
                              text: '${5 - index}',
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: LinearProgressIndicator(
                                value: (5 - index) * 0.2,
                                backgroundColor: Colors.grey[200],
                                valueColor: const AlwaysStoppedAnimation(Colors.amber),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 16.h),
                  // Average Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextOne(
                        text: '4.0',
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                                  (index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextOne(
                            text: '52 Reviews',
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            // Customer Reviews Section
            CustomTextOne(
              text: 'Customer Reviews',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 10.h),
            Column(
              children: List.generate(10, (index) {
                final names = [
                  'Cameron Williamson',
                  'Alexiya Runi',
                  'Max Jakli',
                  'Cameuna',
                  'Hungry Willia',
                  'Cameron Williamson',
                  'Alexiya Runi',
                  'Max Jakli',
                  'Cameuna',
                  'Hungry Willia'
                ];
                final comments = [
                  'It was so fresh & Clean',
                  'The host behave was so good',
                  'It was so fresh & Clean',
                  'It was so fresh & Clean',
                  'It was so fresh & Clean',
                  'It was so fresh & Clean',
                  'The host behave was so good',
                  'It was so fresh & Clean',
                  'It was so fresh & Clean',
                  'It was so fresh & Clean',
                ];
                return Column(
                  children: [
                    _buildReviewTile(
                      name: names[index],
                      comment: comments[index],
                      timeAgo: '2 mins ago',
                    ),
                    Divider(color: Colors.grey[300]),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewTile({
    required String name,
    required String comment,
    required String timeAgo,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: const AssetImage(AppImages.model), // Replace with actual image path
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name and Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextOne(
                    text: name,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  CustomTextOne(
                    text: timeAgo,
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              // Star Rating
              Row(
                children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              // Comment
              CustomTextOne(
                text: comment,
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
