import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:manger_system/independent_pages/edit_activity/binding.dart';
import 'package:manger_system/independent_pages/edit_activity/view.dart';
import 'package:manger_system/independent_pages/re_edit_student/binding.dart';
import 'package:manger_system/independent_pages/re_edit_student/view.dart';
import 'package:manger_system/login/sign_up/binding.dart';
import 'package:manger_system/login/sign_up/view.dart';

import 'home/binding.dart';
import 'home/view.dart';
import 'independent_pages/re_edit_activity/binding.dart';
import 'independent_pages/re_edit_activity/view.dart';
import 'login/binding.dart';
import 'login/view.dart';

abstract class AppPages{
  static final pages=[
    GetPage(name: Routes.LOGIN, page: ()=>LoginPage(),binding: LoginBinding()),
    GetPage(name: Routes.SIGNUP, page: ()=>SignUpPage(),binding: SignUpBinding()),
    GetPage(name: Routes.EDITACTIVITY, page: ()=>EditActivityPage(),binding: EditActivityBinding()),
    GetPage(name: Routes.REEDITACTIVITY, page: ()=>ReEditActivityPage(),binding: ReEditActivityBinding()),
    GetPage(name: Routes.REEDITSTUDENT, page: ()=>ReEditStudentPage(),binding: ReEditStudentBinding()),
    GetPage(name: Routes.HOME, page: ()=>HomePage(),binding: HomeBinding()),
  ];
}

abstract class Routes{
  static const LOGIN = '/login';
  static const EDITACTIVITY = '/edit_activity';
  static const REEDITACTIVITY = '/re_edit_activity';
  static const REEDITSTUDENT = '/re_edit_student';
  static const SIGNUP = '/sign_up';
  static const HOME = '/home';
}