import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_images.dart';
import 'booking_card.dart'; // Import your BookingCard widget file

class WeeklyDate extends StatefulWidget {
  const WeeklyDate({super.key});

  @override
  _WeeklyDateState createState() => _WeeklyDateState();
}

class _WeeklyDateState extends State<WeeklyDate> {
  final List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent(
      'Aesthetic Vila',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      color: AppColors.primaryColor,
      description: 'Aesthetic Vila|assets/shower.png|4.0|1.2k|Monday, May 12|11:00 - 12:00 AM|Road 5, Banasree.',
    ),
    // Add more events here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
          eventsList: _eventList,
          selectedColor: AppColors.primaryColor,
          selectedTodayColor: AppColors.primaryColor,
          todayColor: AppColors.primaryColor,
          locale: 'en_US',
          todayButtonText: 'Today',
          allDayEventText: 'All Day',
          multiDayEndText: 'End',
          expandableDateFormat: 'EEEE, dd MMMM yyyy',
          datePickerType: DatePickerType.date,
          showEvents: true,
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
            // Split description to get BookingCard data
            final details = event.description?.split('|');
            if (details != null && details.length == 7) {
              return BookingCard(
                title: details[0],
                imageUrl: AppImages.shower,
                rating: double.parse(details[2]),
                reviews: details[3],
                date: details[4],
                time: details[5],
                location: details[6],
              );
            }
            return Text('Event: ${event.summary}');
          },
        ),
      ),
    );
  }
}
