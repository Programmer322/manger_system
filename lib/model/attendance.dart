import 'package:manger_system/model/student.dart';

import 'activity.dart';

class Attendance {
  late int attendanceID;
  late Activity activity;
  late Student student;
  late DateTime signInTime;

  Attendance({
    required this.attendanceID,
    required this.activity,
    required this.student,
    required this.signInTime,
  });

  // 将 JSON 转换为 Attendance 对象
  factory Attendance.fromJson(Map<dynamic, dynamic> json) {
    return Attendance(
      attendanceID: json['attendanceID'] as int,
      activity: Activity.fromJson(json['activity']),
      student: Student.fromJson(json['student']),
      signInTime: DateTime.parse(json['signInTime']),
    );
  }

  // 将 Attendance 对象转换为 JSON
  Map<String, dynamic> toMap() {
    return {
      'attendanceID': attendanceID,
      'activity': activity.toMap(),
      'student': student.toMap(),
      'signInTime': signInTime.toIso8601String(),
    };
  }
}