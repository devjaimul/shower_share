import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/views/guest/shower/Confirmed/confirmed_screen.dart';
import 'package:shower_share/views/guest/shower/canceled/canceled_screen.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/views/host/booking%20list/host_requested_screen.dart';

import 'accepted/accepted_screen.dart';
import 'requested/requested_screen.dart';

class ShowerScreen extends StatefulWidget {
  const ShowerScreen({super.key});

  @override
  _ShowerScreenState createState() => _ShowerScreenState();
}

class _ShowerScreenState extends State<ShowerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(
      appBar: AppBar(

        title: CustomTextOne(text: 'My Shower',fontSize: 20.sp,),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
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
                Tab(text: "Requested"),
                Tab(text: "Accepted"),
                Tab(text: "Confirmed"),
                Tab(text: "Canceled"),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
        child: TabBarView(
          controller: _tabController,
          children: [
            RequestedScreen(),
            AcceptedScreen(),
            ConfirmedScreen(),
            CanceledScreen(),
          ],
        ),
      ),
    );
  }

}
