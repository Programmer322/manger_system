import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app_routes.dart';
import 'main.dart';

Widget createApp(){
  return GetMaterialApp(
    theme: ThemeData(
      fontFamily: "San Francisco"
    ),
    builder: FToastBuilder(),
    initialRoute: Routes.LOGIN,
    getPages: AppPages.pages,
    navigatorKey: navigatorKey,
  );
}