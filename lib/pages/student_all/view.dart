import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manger_system/component/student_card.dart';
import 'package:manger_system/model/student.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../AppColors.dart';
import '../../request/requests.dart';
import 'logic.dart';

class StudentAllPage extends StatefulWidget {
  const StudentAllPage({Key? key}) : super(key: key);

  @override
  State<StudentAllPage> createState() => _StudentAllPageState();
}

class _StudentAllPageState extends State<StudentAllPage> {
  final logic = Get.put(StudentAllLogic());
  getData() async {
    var res = await AppRequest().queryAllStudent();
    logic.studentList = [];
    for (Map json in res['data']) {
      logic.studentList.add(Student.fromJson(json));
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('学生一览', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
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
                  return logic.studentList.isEmpty
                      ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.accessibility_new,
                          size: 45,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '暂时还没有学生注册哦',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                        Text(
                          '邀请学生注册吧！',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  )
                      : SearchableList<Student>(
                    emptyWidget: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.accessibility_new,
                            size: 45,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '暂时还没有学生注册哦',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                          Text(
                            '邀请学生注册吧！',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    autoFocusOnSearch: false,
                    initialList: logic.studentList,
                    builder: (Student student)=>StudentCard(
                      student: student,
                      optManager: logic.manager,
                    ),
                    filter: (value) => logic.studentList
                        .where(
                          (element) =>
                          element.content.contains(value),
                    )
                        .toList(),
                    inputDecoration: InputDecoration(
                      labelText: "搜索",
                      filled: true,
                      fillColor: const Color(0xFFCADAA8),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFCADAA8),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFCACCA8),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),);
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
