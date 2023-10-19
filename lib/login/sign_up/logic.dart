import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:manger_system/app_routes.dart';
import 'package:manger_system/method.dart';
import 'package:manger_system/request/requests.dart';

class SignUpLogic extends GetxController {
  String account='';
  String password='';
  String userName='';
  doSignUp()async{
    var res = await AppRequest().appSignUp(account, password, userName);
    print(res);
    appShowToast(res['message']);
    if(res['status']=='000001'){
      var res_1 = await AppRequest().appLogin(account, password);
      print(res_1);
      appShowToast(res_1['message']);
      await box.write('manager', res_1['data']);
      Get.offAllNamed(Routes.HOME,arguments: res_1['data']);
    }
  }
}
