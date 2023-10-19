import 'package:get/get.dart';
import 'package:manger_system/model/manager.dart';

import '../method.dart';

class HomeLogic extends GetxController {
late Manager manager;
@override
  void onInit() {
  manager=Manager.fromJson(box.read('manager'));
  // TODO: implement onInit
    super.onInit();
  }
}
