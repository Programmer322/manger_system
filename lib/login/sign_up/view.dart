import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../AppColors.dart';
import 'logic.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final logic = Get.find<SignUpLogic>();
  bool _isAccountFocused = false;

  bool _isPasswordFocused = false;
  bool _isUserNameFocused = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('活动组织者注册', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/mine_02.png',scale: 1.5,),
                  Image.asset('assets/images/mine_01.png',scale: 1.1,),
                  Image.asset('assets/images/mine_03.png',scale: 1.5,),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: _isAccountFocused ? 60 : 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      onChanged: (value) {
                        logic.account=value;
                      },
                      onTap: () {
                        setState(() {
                          _isAccountFocused = true;
                          _isPasswordFocused = false;
                          _isUserNameFocused=false;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: '账号',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: _isPasswordFocused ? 60 : 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) {
                        logic.password=value;
                      },
                      onTap: () {
                        setState(() {
                          _isAccountFocused = false;
                          _isPasswordFocused = true;
                          _isUserNameFocused=false;

                        });
                      },
                      decoration: InputDecoration(
                        labelText: '密码',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: _isUserNameFocused ? 60 : 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      onChanged: (value) {
                        logic.userName=value;
                      },
                      onTap: () {
                        setState(() {
                          _isAccountFocused = false;
                          _isPasswordFocused = false;
                          _isUserNameFocused=true;

                        });
                      },
                      decoration: InputDecoration(
                        labelText: '姓名',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      logic.doSignUp();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        '注册并登录',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );;
  }
}
