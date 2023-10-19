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

class StudentCard extends StatefulWidget {
  const StudentCard(
      {super.key, required this.optManager, required this.student});
  final Student student;
  final Manager optManager;

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  List registrations = [];

  List attendances = [];

  getData()async{
    registrations = [];
    attendances = [];
    var res = await AppRequest().queryStudentRegistrations(widget.student);
    for (var item in res['data']) {
      registrations.add(Registration.fromJson(item));
    }
   var res_2=await AppRequest().queryStudentAttendance(widget.student);
    for (var item in res_2['data']) {
      attendances.add(Attendance.fromJson(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 500,
                  width: double.infinity,
                  child: FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text(
                                '加载失败,请重试',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'MiSans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 450,
                                        height: 450,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF5F9E9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(18),
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
                                        child: ListView(
                                          children: [
                                            Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text('报名活动一览(${registrations.length})'),
                                                )),
                                            registrations.isEmpty?Padding(
                                              padding: const EdgeInsets.all(40.0),
                                              child: Center(child: Text('暂时没有报名任何活动',style: TextStyle(color: AppColors.secondaryTextColor),),),
                                            ):Container(),
                                            for (Registration registration in registrations)
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Container(
                                                    width: double.infinity,
                                                    height: 80,
                                                    decoration: ShapeDecoration(
                                                      color: AppColors
                                                          .primaryColor,
                                                      shape:
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(18),
                                                      ),
                                                      shadows: const [
                                                        BoxShadow(
                                                          color:
                                                          Color(0x0C000000),
                                                          blurRadius: 15,
                                                          offset: Offset(0, 2),
                                                          spreadRadius: 0,
                                                        )
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          12.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                '活动ID:${registration.activity.activityID}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              Text(
                                                                "活动名称：${registration.activity.activityName}",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                '活动类型:${registration.activity.activityType.activityTypeName}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              Text(
                                                                "报名时间：${registration.registrationTime.year}/${registration.registrationTime.month}/${registration.registrationTime.day} ${registration.registrationTime.hour}:${registration.registrationTime.minute}:${registration.registrationTime.second}",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 450,
                                        height: 450,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF5F9E9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(18),
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
                                        child: ListView(
                                          children: [
                                            Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text('签到活动一览(${attendances.length}/${registrations.length})'),
                                                )
                                            ),
                                            attendances.isEmpty?const Padding(
                                              padding: EdgeInsets.all(40.0),
                                              child: Center(child: Text('暂时无签到活动',style: TextStyle(color: AppColors.secondaryTextColor),),),
                                            ):Container(),
                                            for (Attendance attendance in attendances)
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Container(
                                                    width: double.infinity,
                                                    height: 80,
                                                    decoration: ShapeDecoration(
                                                      color: AppColors
                                                          .primaryColor,
                                                      shape:
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(18),
                                                      ),
                                                      shadows: const [
                                                        BoxShadow(
                                                          color:
                                                          Color(0x0C000000),
                                                          blurRadius: 15,
                                                          offset: Offset(0, 2),
                                                          spreadRadius: 0,
                                                        )
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          12.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                '活动ID:${attendance.activity.activityID}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              Text(
                                                                "活动名称：${attendance.activity.activityName}",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                          Spacer(),
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                '活动类型:${attendance.activity.activityType.activityTypeName}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              Text(
                                                                "签到时间：${attendance.signInTime.year}/${attendance.signInTime.month}/${attendance.signInTime.day} ${attendance.signInTime.hour}:${attendance.signInTime.minute}:${attendance.signInTime.second}",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                );
              });
        },
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
                Icon(
                  Icons.book_rounded,
                  color: AppColors.primaryColor,
                  size: 45,
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('学生ID:${widget.student.studentID}'),
                      Text('学生姓名:${widget.student.studentName}'),
                      Text('学生班级:${widget.student.className}'),
                      Text('学生账号:${widget.student.account}'),
                      Text('学生密码:${widget.student.password}'),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await box.write('temp', widget.student.toMap());
                        Get.toNamed(Routes.REEDITSTUDENT);
                      },
                      child: Text('修改'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // 返回对话框的内容
                            return AlertDialog(
                              title: const Text('确定要删除吗？'),
                              content: const Text('注意:此操作会将学生相关信息及操作信息一起删除哦!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('取消'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    var res = await AppRequest().deleteStudent(widget.student);
                                    if(res['status']=='000001'){
                                      appShowToast('删除成功');
                                      Get.back();
                                    }
                                  },
                                  child: Text('确定'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('删除'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
