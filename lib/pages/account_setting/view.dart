import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manger_system/app_routes.dart';

import '../../AppColors.dart';
import '../../method.dart';
import '../../request/requests.dart';
import 'logic.dart';

class AccountSettingPage extends StatefulWidget {
  AccountSettingPage({Key? key}) : super(key: key);

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  late TextEditingController _accountController;
  late TextEditingController _managerNameController;
  late TextEditingController _passwordController;
  late String newAccount;
  late String newManagerName;
  late String newPassword;
  final logic = Get.put(AccountSettingLogic());
  @override
  void initState() {
    super.initState();
    _accountController = TextEditingController(text: logic.manager.account);
    _managerNameController = TextEditingController(text: logic.manager.managerName);
    _passwordController = TextEditingController(text: logic.manager.managerPassword);
    newAccount = _accountController.text;
    newManagerName = _managerNameController.text;
    newPassword = _passwordController.text;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('账号设置', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                TextFormField(
                  controller: _accountController,
                  enabled: false,
                  onChanged: (val){
                    newAccount = val;
                  },
                  decoration: InputDecoration(labelText: '账号'),
                ),
                TextFormField(
                  onChanged: (val){
                    newManagerName = val;
                  },
                  controller: _managerNameController,
                  decoration: InputDecoration(labelText: '姓名'),
                ),
                TextFormField(
                  controller: _passwordController,
                  onChanged: (val){
                    newPassword = val;
                  },
                  obscureText: true,
                  decoration: InputDecoration(labelText: '密码'),
                ),
              ],
            ),
            SizedBox(height: 70,),
            Row(
              children: [
                Expanded(child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent
                    ),
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // 返回对话框的内容
                          return AlertDialog(
                            title: const Text('确定要删除吗？'),
                            content: const Text('注意:此操作会将您的帐号和您发起的活动一起删除哦!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('取消'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  var res = await AppRequest().deleteManagerAccount(logic.manager);
                                  if(res['status']=='000001'){
                                    appShowToast('注销成功');
                                    Get.offAllNamed(Routes.LOGIN);
                                  }
                                },
                                child: const Text('确定'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('注销账号'),
                  ),
                )),
                SizedBox(width: 50,),
                Expanded(child:
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentColor
                    ),
                    onPressed: () async {
                      Map formData = {
                        "managerName": newManagerName,
                        "managerPassword": newPassword
                      };
                      if(newPassword==logic.manager.managerPassword&&newManagerName==logic.manager.managerName){
                        appShowToast('您未作出任何更改');
                      }else{
                        if(newPassword==''){
                          appShowToast('密码不能为空');
                        }else{
                          if(newManagerName==''){
                            appShowToast('管理员姓名不能为空');
                          }else{
                            var res = await AppRequest().putManagerAccount(logic.manager, formData);
                            if(res['status']=='000001'){
                              appShowToast(res['message']);
                              await box.write('manager', {
                                "account": logic.manager.account,
                                "managerID": logic.manager.managerID,
                                "managerName": newManagerName,
                                "managerPassword": newPassword
                              });
                              logic.onInit();
                              setState(() {
                              });
                            }
                          }
                        }
                      }
                    },
                    child: Text('保存设置'),
                  ),
                )
                ),
              ],
            ),
            SizedBox(height: 25,),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentColor
                ),
                onPressed: () async {
                  Get.offAllNamed(Routes.LOGIN);
                },
                child: const Text('退出登录'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
