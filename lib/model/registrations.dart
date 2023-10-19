import 'package:manger_system/model/student.dart';

import 'activity.dart';

class Registration {
  late int registrationID;
  late Activity activity;
  late Student student;
  late DateTime registrationTime;

  Registration({
    required this.registrationID,
    required this.activity,
    required this.student,
    required this.registrationTime,
  });

  // 将JSON转换为Registration对象
  factory Registration.fromJson(Map<dynamic, dynamic> json) {
    return Registration(
      registrationID: json['registrationID'] as int,
      activity: Activity.fromJson(json['activity']),
      student: Student.fromJson(json['student']),
      registrationTime: DateTime.parse(json['registrationTime']),
    );
  }

  // 将Registration对象转换为JSON
  Map<String, dynamic> toMap() {
    return {
      'registrationID': registrationID,
      'activity': activity.toMap(),
      'student': student.toMap(),
      'registrationTime': registrationTime.toIso8601String(),
    };
  }
}