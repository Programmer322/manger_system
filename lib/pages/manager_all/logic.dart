import 'package:get/get.dart';

import '../../method.dart';
import '../../model/manager.dart';

class ManagerAllLogic extends GetxController {
  List<Manager> managerList=[];
  late Manager manager;
  @override
  void onInit() {
    manager=Manager.fromJson(box.read('manager'));
    // TODO: implement onInit
    super.onInit();
  }
}
