import 'package:get/get.dart';

import 'logic.dart';

class ManagerAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManagerAllLogic());
  }
}
