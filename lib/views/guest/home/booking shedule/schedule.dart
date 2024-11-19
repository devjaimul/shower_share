import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/utils/app_colors.dart';

import 'package:shower_share/global_widgets/custom_text.dart';

import 'avaiable_time.dart';
import 'schedule_booking.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController here
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Don't forget to dispose the TabController when the widget is removed
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // GetX controller initialization

    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: "Schedule booking",
          fontSize: 18.sp,
        ),
        bottom: TabBar(
          controller: _tabController,  // Pass TabController here
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.primaryColor.withOpacity(0.4),
          indicatorColor: AppColors.primaryColor,
          dividerColor: AppColors.buttonSecondColor,
          tabs: const [
            Tab(text: "Schedule Booking"),
            Tab(text: "Available Today"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,  // Pass TabController here as well
        children: const [
          ScheduleBooking(),
         AvaiableTime()
        ],
      ),
    );
  }
}
