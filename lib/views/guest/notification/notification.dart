import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_icons.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: 'Notifications',
          fontSize: 18.sp,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                color: index == 0 ? Colors.blue.shade50 : Colors.white,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 2.w),
                  child: ListTile(
                    leading:Image.asset(AppIcons.notifications2,height: 24.h,width: 24.w,),
                    title: CustomTextOne(text: 'William accepted your Request.',color: Colors.black,fontSize: 14.sp,maxLine: 1,textOverflow: TextOverflow.ellipsis,textAlign: TextAlign.start,),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextOne(text: 'Sorry, your information’s picture are not clear. ',color: AppColors.textColor,fontSize: 12.sp,maxLine: 2,textOverflow: TextOverflow.ellipsis,textAlign: TextAlign.start,),
                        CustomTextOne(text: '12:35 PM',color: Colors.black.withOpacity(0.8),fontSize: 12.sp,maxLine: 1,textOverflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ),
                )
              ),
              Divider(color: AppColors.primaryColor,thickness: 1,indent: 20.w,endIndent: 20.w,),
            ],
          );
        },
      ),
    );
  }
}
