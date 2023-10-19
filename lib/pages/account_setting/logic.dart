import 'package:get/get.dart';

import '../../method.dart';
import '../../model/manager.dart';

class AccountSettingLogic extends GetxController {
  late Manager manager;
  @override
  void onInit() {
    manager=Manager.fromJson(box.read('manager'));
    // TODO: implement onInit
    super.onInit();
  }
}
