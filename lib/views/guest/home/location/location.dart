import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/controllers/location/filter_controller.dart';
import 'package:shower_share/controllers/location/location_controller.dart';
import 'package:shower_share/global_widgets/shower_card_title.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/views/widgets/custom_text_field.dart';

import 'custom_filter.dart';

class LocationScreen extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());
  final FilterController filterController = Get.put(FilterController());

  LocationScreen({super.key});

  void openFilterDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CustomFilter(filterController: filterController);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 24.sp),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Expanded(
                    child: Obx(() {
                      return CustomTextField(
                        controller: TextEditingController(
                          text: locationController.searchAddress.value,
                        ),
                        hintText: 'Search Location',
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset(AppIcons.search),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(width: 8.w),
                  IconButton(
                    onPressed: () => openFilterDrawer(context),
                    icon: Card(
                      color: const Color(0xffF5F9FE),
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: Image.asset(AppIcons.filter),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Obx(() {
                    return GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: LocationController.initialPosition,
                      myLocationEnabled: true,
                      markers: locationController.markers.value,
                      onMapCreated: (GoogleMapController mapController) {
                        locationController.mapController.complete(mapController);
                      },
                      onTap: locationController.onMapTapped,
                    );
                  }),
                  Positioned(
                    bottom: 20.h,
                    left: 16.w,
                    right: 16.w,
                    child: ShowerCardTile(controller: locationController),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

