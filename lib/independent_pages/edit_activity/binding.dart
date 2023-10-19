import 'package:get/get.dart';

import 'logic.dart';

class EditActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditActivityLogic());
  }
}
