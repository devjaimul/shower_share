import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/utils/app_images.dart';

import '../../../controllers/message/message_controller.dart';
import '../../../utils/app_colors.dart';


class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});

  final MessageController messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(text: 'Inbox',fontSize: 18.sp,),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            children: [
              /// ==================================> Search ====================================>
              _buildSearchBar(),
              SizedBox(height: 20.h),
              /// ===================================== ChatList ====================================>
              Expanded(child: _buildChatList()),
            ],
          ),
        ),
      ),

    );
  }
  /// ===================================== _buildSearchBar ====================================>
  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonSecondColor,
          border: Border.all(width: 0.9.w, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
        /// ===================================== Search ====================================>
        child: Row(
          children: [
            SizedBox(width: 14.w),
            Image.asset(AppIcons.search,height: 20.h,width: 20.w,),
            SizedBox(width: 10.w),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  /// ===================================== _buildChatList ====================================>
  Widget _buildChatList() {
    return Obx(() {
      return ListView.separated(
        itemCount: messageController.chatData.length,
        separatorBuilder: (_, __) =>
            Divider(color: Colors.grey.shade300, thickness: 1),
        itemBuilder: (context, index) {
          final chat = messageController.chatData[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 25.r,
              backgroundImage:  const AssetImage(AppImages.man),
            ),
            title: CustomTextOne(text: chat["name"] as String,color: AppColors.textColor,fontSize: 15.sp,maxLine: 1,textAlign: TextAlign.start,textOverflow: TextOverflow.ellipsis,),
            subtitle:CustomTextOne(text: "hello how are you",fontSize: 14,color: AppColors.textColor.withOpacity(0.5),maxLine: 1,textAlign: TextAlign.start,textOverflow: TextOverflow.ellipsis,),
            /// ================================> Time ==================================>
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
               CustomTextOne(text:  chat["time"] as String,color: AppColors.textColor.withOpacity(0.8),fontSize: 12.sp,maxLine: 1,textAlign: TextAlign.start,textOverflow: TextOverflow.ellipsis,),
                SizedBox(width: 10.w),
                if (chat["isUnread"] as bool)
                  GestureDetector(
                    onTap: () => messageController.markAsRead(index),
                    child: CircleAvatar(
                      radius: 5.r,
                      backgroundColor: Colors.red,
                    ),
                  ),
              ],
            ),
            onTap: () {
              Get.toNamed(RouteNames.messageChatScreen);
            },
          );
        },
      );
    });
  }
}
