import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../AppColors.dart';
import '../../app_routes.dart';
import '../../method.dart';
import '../../request/requests.dart';
import 'logic.dart';

class ReEditStudentPage extends StatefulWidget {
  ReEditStudentPage({Key? key}) : super(key: key);

  @override
  State<ReEditStudentPage> createState() => _ReEditStudentPageState();
}

class _ReEditStudentPageState extends State<ReEditStudentPage> {
  final logic = Get.find<ReEditStudentLogic>();
  String _studentName = '';
  String _className = '';
  String _password = '';
  TextEditingController _studentNameController = TextEditingController();
  TextEditingController _classNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void initState() {
    _studentName=logic.student.studentName;
    _className=logic.student.className;
    _password=logic.student.password;
    _classNameController.text=logic.student.className;
    _studentNameController.text=logic.student.studentName;
    _passwordController.text=logic.student.password;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('修改学生信息', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 200,),
            Row(
              children: [
                const Expanded(
                    child: Text('账  号:')),
                Expanded(
                  flex: 10,
                  child: Text(
                      logic.student.account
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('姓  名:')),
                Expanded(
                  flex: 10,
                  child: TextField(
                    controller: _studentNameController,
                    onChanged: (value) {
                      _studentName=value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                    child: Text('班  级:')),
                Expanded(
                  flex: 10,
                  child: TextField(
                    controller: _classNameController,
                    onChanged: (value) {
                      _className = value;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                    child: Text('密  码:')),
                Expanded(
                  flex: 10,
                  child: TextField(
                    controller: _passwordController,
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor
                ),
                onPressed: () async {
                  Map<String, dynamic> formData ={
                      "studentName":_studentName,
                      "className":_className,
                      "password":_password
                    };
                  if(_studentName==logic.student.studentName&&_className==logic.student.className&&_password==logic.student.password){
                    appShowToast('您未作出任何更改');
                  }else{
                    if(_studentName==''){
                      appShowToast('学生姓名不能为空');
                    }else{
                      if(_className==''){
                        appShowToast('学生班级不能为空');
                      }else{
                        if(_password==''){
                          appShowToast('学生账号密码不能为空');
                        }else{
                          var res = await AppRequest().putStudent(logic.student, formData);
                          appShowToast(res['message']);
                          print(res);
                          if(res['status']=='000001'){
                            Get.offAllNamed(Routes.HOME);
                          }
                        }
                      }
                    }
                  }

                },
                child: const Text('提交'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
