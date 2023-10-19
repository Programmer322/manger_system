class Manager {
  final int managerID;
  final String account;
  final String managerName;
  final String managerPassword;

  Manager({
    required this.managerID,
    required this.account,
    required this.managerName,
    required this.managerPassword,
  });

  factory Manager.fromJson(Map<dynamic, dynamic> json) {
    return Manager(
      managerID: json['managerID'],
      account: json['account'],
      managerName: json['managerName'],
      managerPassword: json['managerPassword'],
    );
  }

  get content => managerName+managerID.toString()+account;

  Map<String, dynamic> toMap() {
    return {
      'managerID': managerID,
      'account': account,
      'managerName': managerName,
      'managerPassword': managerPassword,
    };
  }
}