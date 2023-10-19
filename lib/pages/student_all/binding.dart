import 'package:get/get.dart';

import 'logic.dart';

class StudentAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentAllLogic());
  }
}
