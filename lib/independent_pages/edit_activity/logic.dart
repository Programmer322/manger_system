import 'package:get/get.dart';
import 'package:manger_system/model/manager.dart';

import '../../method.dart';

class EditActivityLogic extends GetxController {
late Manager manager;

@override
  void onInit() {
    super.onInit();
    manager=Manager.fromJson(box.read('manager'));
  // TODO: implement onReady
  }

}
