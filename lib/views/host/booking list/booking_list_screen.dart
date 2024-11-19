import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/views/host/booking%20list/host_confirm_screen.dart';

import 'host_requested_screen.dart';

class BookingListScreen extends StatelessWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Requested and Confirmed
      child: Scaffold(
        appBar: AppBar(
          title: CustomTextOne(
            text: 'Booking List',
            fontSize: 18.sp,

          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: AppColors.primaryColor,
            indicatorWeight: 2.5,
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.primaryColor.withOpacity(0.4),
            dividerColor: AppColors.buttonSecondColor,
            labelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            tabs: const [
              Tab(
                child:Text('Requested')
              ),
              Tab(
                child:Text('Confirmed')
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Tab 1: Requested Bookings
            HostRequestedScreen(),
            // Tab 2: Confirmed Bookings
            HostConfirmScreen(),
          ],
        ),
      ),
    );
  }


}
