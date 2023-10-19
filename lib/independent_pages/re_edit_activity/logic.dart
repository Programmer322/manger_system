import 'package:get/get.dart';

import '../../method.dart';
import '../../model/activity.dart';

class ReEditActivityLogic extends GetxController {
  late final Activity activity;
  @override
  void onInit() {
    activity=Activity.fromJson(box.read('temp'));
    // TODO: implement onReady
    super.onInit();
  }
}
