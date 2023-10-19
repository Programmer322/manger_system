import 'activity_type.dart';
import 'manager.dart';

class Activity {
  final int activityID;
  final String activityName;
  final DateTime activityTime;
  final String location;
  final Manager manager;
  final int participantsCount;
  final ActivityType activityType;

  Activity({
    required this.activityID,
    required this.activityName,
    required this.activityTime,
    required this.location,
    required this.manager,
    required this.participantsCount,
    required this.activityType,
  });

  factory Activity.fromJson(Map<dynamic, dynamic> json) {
    return Activity(
      activityID: json['activityID'],
      activityName: json['activityName'],
      activityTime: DateTime.parse(json['activityTime']),
      location: json['location'],
      manager: Manager.fromJson(json['manager']),
      participantsCount: json['participantsCount'],
      activityType: ActivityType.fromJson(json['activityType']),
    );
  }

  get content => activityID.toString()+activityName+activityTime.toString()+activityType.activityTypeName+manager.managerName+location;

  Map<dynamic, dynamic> toMap() {
    return {
      'activityID': activityID,
      'activityName': activityName,
      'activityTime': activityTime.toIso8601String(),
      'location': location,
      'manager': manager.toMap(),
      'participantsCount': participantsCount,
      'activityType': activityType.toMap(),
    };
  }
}