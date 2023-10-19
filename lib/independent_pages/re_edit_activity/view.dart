import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manger_system/app_routes.dart';
import 'package:manger_system/model/activity.dart';

import '../../AppColors.dart';
import '../../component/time_picker.dart';
import '../../method.dart';
import '../../request/requests.dart';
import 'logic.dart';

class ReEditActivityPage extends StatefulWidget {
  ReEditActivityPage({Key? key}) : super(key: key);
  @override
  State<ReEditActivityPage> createState() => _ReEditActivityPageState();
}

class _ReEditActivityPageState extends State<ReEditActivityPage> {
  final logic = Get.find<ReEditActivityLogic>();

  late String _selectedActivityType ;
  DateTime? _selectedDateTime ;
  String _activityName = ''; // 活动名称
  String _location = ''; // 活动地点
  final int _participantsCount = 0; // 默认参与人数为0\
  final TextEditingController _activityNameController = TextEditingController();
  TextEditingController _activityLocationController = TextEditingController();

  List<String> activityTypeList=[
    '社区服务',
    '乡村支教',
    '文化传播',
    '知识科普',
    '关怀行动',
    '志愿卫国',
    '志愿者嘉年华',
    '学雷锋月系列',
  ];

  Map<String, int> activityTypeMap={
    '社区服务': 1,
    '乡村支教': 2,
    '文化传播': 3,
    '知识科普': 4,
    '关怀行动': 5,
    '志愿卫国': 6,
    '志愿者嘉年华': 7,
    '学雷锋月系列': 8,
  };
@override
  void initState() {
  _selectedDateTime = logic.activity.activityTime;
  _selectedActivityType=logic.activity.activityType.activityTypeName;
  _activityLocationController.text=logic.activity.location;
  _location=logic.activity.location;
  _activityNameController.text=logic.activity.activityName;
  _activityName=logic.activity.activityName;
  // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加活动', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 200,),
            Row(
              children: [
                Text('活动类型:'),
                SizedBox(width: 40,),
                DropdownButton<String>(
                  value: _selectedActivityType,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedActivityType = newValue!;
                    });
                  },
                  items: [
                    for(var item in activityTypeList)
                      DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('活动名称:')),
                Expanded(
                  flex: 10,
                  child: TextField(
                    controller: _activityNameController,
                    onChanged: (value) {
                      _activityName = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                    child: Text('地        点：')),
                Expanded(
                  flex: 10,
                  child: TextField(
                    controller: _activityLocationController,
                    onChanged: (value) {
                      _location = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                    child: Text('日        期:')),
                Expanded(
                  flex: 10,
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentColor
                      ),
                      onPressed: () async {
                        DateTime? date = await showAppDatePicker(context);
                        setState(() {
                          _selectedDateTime = date;
                        });
                      },
                      child: Text(_selectedDateTime == null
                          ? '选择日期'
                          : '${_selectedDateTime!.year}/${_selectedDateTime!.month}/${_selectedDateTime!.day}'),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor
                ),
                onPressed: () async {
                  Map<String, dynamic> formData = {
                    "activityName": _activityName,
                    "activityTime": _selectedDateTime?.toIso8601String() ?? '', // 将DateTime转换为ISO 8601字符串
                    "location": _location,
                    "manager": {
                      "managerID": logic.activity.manager.managerID, // 这里假设manager是一个对象，并且有managerID属性
                    },
                    "participantsCount": _participantsCount,
                    "activityType": {
                      "activityTypeID": activityTypeMap[_selectedActivityType],
                    }
                  };
                  if(_activityName==logic.activity.activityName&&_location==logic.activity.location&&_selectedActivityType==logic.activity.activityType.activityTypeName&&_selectedDateTime==logic.activity.activityTime){
                    appShowToast('您未作出任何更改');
                  }else{
                    if(_activityName==''){
                      appShowToast('活动名称不能为空');
                    }else{
                      if(_location==''){
                        appShowToast('活动地点不能为空');
                      }else{
                        if(_selectedDateTime==null){
                          appShowToast('请选择活动时间');
                        }else{
                          var res = await AppRequest().putActivity(logic.activity.activityID,formData);
                          appShowToast(res['message']);
                          print(res);
                          if(res['status']=='000001'){
                            Get.offAllNamed(Routes.HOME);
                          }
                        }
                      }
                    }
                  }

                },
                child: const Text('提交'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
