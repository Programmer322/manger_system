class ActivityType {
  final int activityTypeID;
  final String activityTypeName;

  ActivityType({
    required this.activityTypeID,
    required this.activityTypeName,
  });

  factory ActivityType.fromJson(Map<String, dynamic> json) {
    return ActivityType(
      activityTypeID: json['activityTypeID'],
      activityTypeName: json['activityTypeName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'activityTypeID': activityTypeID,
      'activityTypeName': activityTypeName,
    };
  }
}