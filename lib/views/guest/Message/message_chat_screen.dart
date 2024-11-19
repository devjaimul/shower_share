import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_images.dart';

class MessageChatScreen extends StatefulWidget {
  const MessageChatScreen({super.key});

  @override
  _MessageChatScreenState createState() => _MessageChatScreenState();
}

class _MessageChatScreenState extends State<MessageChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool fromCamera) async {
    final pickedFile = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _messages.add({
          'type': 'image',
          'content': pickedFile.path,
          'isSentByMe': true,
        });
      });
    }
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'type': 'text',
          'content': _messageController.text.trim(),
          'isSentByMe': true,
        });
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           CustomTextOne(text: "Jenni Miranda",fontSize: 15.sp,color: Colors.black,maxLine: 1,textOverflow: TextOverflow.ellipsis,),
           CustomTextTwo(text: 'last seen today at 3:12pm',fontSize: 12.sp,),
          ],
        ),
        actions: [
          InkWell(
            onTap: (){
              Get.toNamed(RouteNames.profileAboutScreen);
            },
            child: CircleAvatar(
              radius: 20.r,
              backgroundImage:  const AssetImage(AppImages.man),
            ),
          ),
        ],

      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return message['type'] == 'text'
                      ? ChatBubble(
                    time: '3.24 pm',
                    message: message['content'],
                    isSentByMe: message['isSentByMe'],
                  )
                      : ImageBubble(
                    imagePath: message['content'],
                    isSentByMe: message['isSentByMe'],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => _pickImage(true),
                    icon: const Icon(Icons.camera_alt, color: AppColors.primaryColor),
                  ),
                  IconButton(
                    onPressed: () => _pickImage(false),
                    icon: const Icon(Icons.photo_library, color: AppColors.primaryColor),
                  ),
                  Flexible(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(color: AppColors.primaryColor.withOpacity(0.5))
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 10.h,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send, color: AppColors.primaryColor),
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

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSentByMe;

  const ChatBubble({super.key,
    required this.message,
    required this.isSentByMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment:
        isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSentByMe)
            CircleAvatar(
              backgroundImage: const NetworkImage(
                'https://via.placeholder.com/150',
              ),
              radius: 15.r,
            ),
          if (!isSentByMe) SizedBox(width: 10.w),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75, // Bubble width max 75% of screen
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSentByMe
                    ? AppColors.primaryColor
                    : AppColors.buttonSecondColor,
                borderRadius: BorderRadius.circular(20.r).copyWith(
                  bottomRight: Radius.circular(isSentByMe ? 0 : 20.r),
                  bottomLeft: Radius.circular(isSentByMe ? 20.r : 0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextTwo(
                    text: message,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5.h),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomTextTwo(
                      text: time,
                      color: Colors.white,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class ImageBubble extends StatelessWidget {
  final String imagePath;
  final bool isSentByMe;

  const ImageBubble({super.key,
    required this.imagePath,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
        isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: FileImage(File(imagePath)),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
