
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shower_share/themes/light_theme.dart';

import 'controllers/controller_bindings.dart';
import 'routes/route_name.dart';
import 'routes/route_pages.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: light(),
          debugShowCheckedModeBanner: false,
          getPages: RoutePages.routes,
          initialRoute: RouteNames.splashScreen,
          initialBinding: ControllerBindings(),
        );
      },
    );
  }


}