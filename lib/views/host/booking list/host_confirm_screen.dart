import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/global_widgets/custom_text_button.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/utils/app_images.dart';
import 'package:shower_share/views/guest/Message/message_chat_screen.dart';

class HostConfirmScreen extends StatelessWidget {
  const HostConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define events using the correct API
    final List<NeatCleanCalendarEvent> eventList = [
      NeatCleanCalendarEvent(
        'Booking 1',
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(hours: 1)),
        description: 'Daniel Martinez|Monday, May 12|11:00 - 12:00 AM|1 Hour',
      ),
      NeatCleanCalendarEvent(
        'Booking 2',
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(hours: 2)),
        description: 'Aliya Joli|Monday, May 12|11:00 - 12:00 AM|1 Hour',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: 'Host Confirm Screen',
          fontSize: 18.sp,
          color: Colors.white,
        ),
      ),
      body: Calendar(
        startOnMonday: true,
        weekDays: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        eventsList: eventList, // Correct parameter for events
        selectedColor: AppColors.primaryColor,
        todayColor: AppColors.primaryColor,
        locale: 'en_US',
        todayButtonText: 'Today',
        expandableDateFormat: 'EEEE, dd MMMM yyyy',
        showEvents: true,
        datePickerType: DatePickerType.date,
        selectedTodayColor: AppColors.primaryColor,
        dayOfWeekStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        displayMonthTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
        showEventListViewIcon: false,
        eventCellBuilder: (context, event, start, end) {
          final details = event.description.split('|');
          if (details.length >= 4) {
            return _bookingCard(
              name: details[0],
              date: details[1],
              time: details[2],
              duration: details[3],
              onAccept: () {
               Get.to(const MessageChatScreen());
              },

              imageUrl: AppImages.model,
            );
          }
          return Text('Event: ${event.summary}');
        },
      ),
    );
  }

  Widget _bookingCard({
    required String name,
    required String date,
    required String time,
    required String duration,
    required VoidCallback onAccept,

    required String imageUrl,
  }) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      child: Card(
        color: Colors.white,
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // User Image
              CircleAvatar(
                radius: 40.r,
                backgroundImage: AssetImage(imageUrl),
              ),
              SizedBox(width: 20.w),

              // Booking Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomTextOne(
                        text: name,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        maxLine: 1,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(width: 5.w),
                      Image.asset(
                        AppIcons.verify,
                        height: 16.h,
                        width: 16.w,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, size: 14.sp, color: Colors.grey),
                      SizedBox(width: 5.w),
                      CustomTextOne(
                        text: date,
                        fontSize: 12.sp,
                        color: AppColors.textColor,
                        maxLine: 1,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 14.sp, color: Colors.grey),
                      SizedBox(width: 5.w),
                      CustomTextOne(
                        text: time,
                        fontSize: 12.sp,
                        color: AppColors.textColor,
                        maxLine: 1,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  CustomTextOne(
                    text: "For : $duration",
                    fontSize: 12.sp,
                    color: AppColors.textColor,
                  ),
                  SizedBox(height: 5.h),
                  // Accept and Cancel Buttons
                  SizedBox(
                    width: 150.w,
                    child: CustomTextButton(
                      text: 'Chat',
                      onTap: onAccept,
                      padding: 2.r,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
