import 'package:get/get.dart';
import 'package:manger_system/model/student.dart';

import '../../method.dart';
import '../../model/manager.dart';

class StudentAllLogic extends GetxController {
 List<Student> studentList=[];
 late Manager manager;
 @override
 void onInit() {
  manager=Manager.fromJson(box.read('manager'));
  // TODO: implement onInit
  super.onInit();
 }
}
