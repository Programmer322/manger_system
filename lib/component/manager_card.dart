import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:manger_system/AppColors.dart';
import 'package:manger_system/app_routes.dart';
import 'package:manger_system/method.dart';
import 'package:manger_system/model/manager.dart';
import 'package:manger_system/model/student.dart';
import 'package:manger_system/request/requests.dart';

import '../model/attendance.dart';
import '../model/registrations.dart';

class ManagerCard extends StatefulWidget {
  const ManagerCard(
      {super.key, required this.optManager, required this.manager});
  final Manager manager;
  final Manager optManager;
  @override
  State<ManagerCard> createState() => _ManagerCardState();
}

class _ManagerCardState extends State<ManagerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFF5F9E9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 15,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Icon(
                Icons.person,
                color: AppColors.primaryColor,
                size: 45,
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('管理员ID:${widget.manager.managerID}'),
                    Text('管理员姓名:${widget.manager.managerName}'),
                    Text('管理员账号:${widget.manager.account}'),
                  ],
                ),
              ),
              SizedBox(
                width: 100,
              ),
          widget.manager.managerID==widget.optManager.managerID?
              Padding(
                padding: const EdgeInsets.only(right: 75.0),
                child: Text('(我)'),
              ):Container()
            ],
          ),
        ),
      ),
    );
  }
}
