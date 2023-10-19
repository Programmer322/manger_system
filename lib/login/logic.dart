import 'package:get/get.dart';
import 'package:manger_system/app_routes.dart';
import 'package:manger_system/method.dart';
import 'package:manger_system/request/requests.dart';

class LoginLogic extends GetxController {

  String account='';
  String password='';

  doLogin() async {
    try{
      var res = await AppRequest().appLogin(account, password);
      appShowToast(res['message']);
      await box.write('manager', res['data']);
      Get.offAllNamed(Routes.HOME);
    }catch(e){
      appShowToast("账号或密码错误");
    }
  }
}
