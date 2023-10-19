import 'package:dio/dio.dart';
import 'package:manger_system/model/activity.dart';
import 'package:manger_system/model/attendance.dart';
import 'package:manger_system/model/manager.dart';
import 'package:manger_system/model/registrations.dart';
import 'package:manger_system/model/student.dart';
import 'app_request.dart';

class AppRequest {
  Dio dio = AppRequestType().getDio();
  appLogin(String account, String password) async {
    var response =
        await dio.post('managers/login?account=$account&password=$password');
    return response.data;
  }

  appSignUp(String account, String password, String managerName) async {
    var response = await dio.post('managers/', data: {
      "managerPassword": password,
      "managerName": managerName,
      "account": account
    });
    return response.data;
  }

//活动相关请求
  queryAllActivity() async {
    var response = await dio.get('activities/');
    return response.data;
  }

  addActivity(Map data) async {
    var response = await dio.post('activities/', data: data);
    return response.data;
  }

  putActivity(int activityId, Map data) async {
    var response = await dio.put('activities/$activityId', data: data);
    return response.data;
  }

  deleteActivity(int activityID) async {
    var response = await dio.delete('activities/$activityID');
    return response.data;
  }

  //学生业务
  queryAllStudent() async {
    var response = await dio.get('students/');
    return response.data;
  }

  addStudent() async {
    var response = await dio.post('students/');
    return response.data;
  }

  putStudent(Student student, Map data) async {
    var response = await dio.put('students/${student.studentID}', data: data);
    return response.data;
  }

  deleteStudent(Student student) async {
    var response = await dio.delete('students/${student.studentID}');
    return response.data;
  }

  //查询报名
  queryActivityRegistrations(Activity activity) async {
    var response = await dio.get(
        'registrations/registration/by-activity?activityId=${activity.activityID}');
    return response.data;
  }

  queryActivityAttendance(Activity activity) async {
    var response = await dio.get(
        'attendances/attendance/by-activity?activityId=${activity.activityID}');
    return response.data;
  }

  queryStudentRegistrations(Student student) async {
    var response = await dio.get(
        'registrations/registration/by-student?studentId=${student.studentID}');
    return response.data;
  }

  queryStudentAttendance(Student student) async {
    var response = await dio.get(
        'attendances/attendance/by-student?studentId=${student.studentID}');
    return response.data;
  }

  queryAllManager() async {
    var response = await dio.get('managers/');
    return response.data;
  }

  deleteRegistration(Registration registration) async {
    var response =
        await dio.delete('registrations/${registration.registrationID}');
    return response.data;
  }

  deleteAttendance(Attendance attendance) async {
    var response = await dio.delete('attendances/${attendance.attendanceID}');
    return response.data;
  }

  //账号设置
  putManagerAccount(Manager manager, Map data) async {
    var response = await dio.put('managers/${manager.managerID}', data: data);
    return response.data;
  }

  deleteManagerAccount(Manager manager) async {
    var response = await dio.delete('managers/${manager.managerID}');
    return response.data;
  }
}
