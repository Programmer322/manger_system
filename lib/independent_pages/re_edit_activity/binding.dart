import 'package:get/get.dart';

import 'logic.dart';

class ReEditActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReEditActivityLogic());
  }
}
