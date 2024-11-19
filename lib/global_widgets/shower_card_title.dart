import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/controllers/location/location_controller.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_images.dart';
import 'package:shower_share/global_widgets/custom_text.dart';

class ShowerCardTile extends StatelessWidget {
  const ShowerCardTile({
    super.key,
    required this.controller,
  });

  final LocationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.locationList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.r),
            child: Container(
              width: 280.w,
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.r)),
                      child: Image.asset(
                        AppImages.shower,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            CustomTextOne(
                              text: controller
                                  .locationList[index],
                              maxLine: 1,
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                            SizedBox(height: 4.h),
                            CustomTextOne(
                              text: "817 Rebeca Lodge Suite",
                              maxLine: 1,
                              fontSize: 12.sp,
                              color: AppColors.textColor,
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    const CustomTextTwo(
                                      text: "4.5 ",
                                      color: Colors.black,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color:
                                      AppColors.yellowColor,
                                      size: 15.h,
                                    )
                                  ],
                                ),
                                const CustomTextTwo(
                                  text: "4.5 Miles",
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}