import 'package:get/get.dart';

import 'logic.dart';

class AccountSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountSettingLogic());
  }
}
