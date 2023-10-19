import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manger_system/AppColors.dart';
import 'package:manger_system/app_routes.dart';
import 'package:manger_system/component/activity_card.dart';
import 'package:manger_system/model/activity.dart';
import 'package:manger_system/request/requests.dart';
import 'package:searchable_listview/searchable_listview.dart';

import 'logic.dart';

class ActivityAllPage extends StatefulWidget {
  const ActivityAllPage({Key? key}) : super(key: key);
  @override
  State<ActivityAllPage> createState() => _ActivityAllPageState();
}

class _ActivityAllPageState extends State<ActivityAllPage> {
  getData() async {
    var res = await AppRequest().queryAllActivity();
    logic.activityList = [];
    for (Map json in res['data']) {
      logic.activityList.add(Activity.fromJson(json));
    }
  }

  final logic = Get.put(ActivityAllLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('活动一览', style: TextStyle(fontSize: 20)),
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
                  return logic.activityList.isEmpty
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
                                '暂时还没有活动哦',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor),
                              ),
                              Text(
                                '点击右下角按钮添加活动吧',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        )
                      :SearchableList(
                    emptyWidget:const Center(
                      child: SizedBox(
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              '暂时还没有活动哦',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor),
                            ),
                            Text(
                              '点击右下角按钮添加活动吧',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    autoFocusOnSearch: false,
                    initialList: logic.activityList, builder: (Activity activity)=>ActivityCard(
                    activity: activity,
                    optManager: logic.manager,
                  ),
                    filter: (value) => logic.activityList
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
                    ),

                  );

                  // ListView(
                  //         children: [
                  //           for (Activity activity in logic.activityList)
                  //             ActivityCard(
                  //               activity: activity,
                  //               optManager: logic.manager,
                  //             )
                  //         ],
                  //       );
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
        onPressed: () async {
          await Get.toNamed(Routes.EDITACTIVITY);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
