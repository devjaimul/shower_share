import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/global_widgets/custom_text.dart';
import 'package:shower_share/utils/app_strings.dart';

class  TermsScreen extends StatelessWidget {
  const  TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: CustomTextOne(text: 'Terms & Condition',fontSize: 20.sp,),),
      body: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: CustomTextTwo(text: AppString.policy,textAlign: TextAlign.start,),
        ),
      ),
    );
  }
}
