import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manger_system/AppColors.dart';
import 'package:manger_system/main.dart';
import 'dart:io' show Platform;

final box = GetStorage();

appShowToast(String msg) {
    FToast fToast = FToast();
    fToast.init(navigatorKey.currentContext!);
    fToast.showToast(child: Container(
        height: 40,
        color: AppColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
          child: Text(msg,style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white
          ),),
        )));
}