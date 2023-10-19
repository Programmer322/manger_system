import 'package:get/get.dart';

import 'logic.dart';

class ReEditStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReEditStudentLogic());
  }
}
