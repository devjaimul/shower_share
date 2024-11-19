
import 'package:flutter/material.dart';
import 'package:shower_share/utils/app_images.dart';



class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;
    return Image.asset(
      AppImages.appLogo,
      height: sizeH * .15,
      width: sizeW * .4,
    );
  }
}