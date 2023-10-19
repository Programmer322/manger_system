class Student {
  int studentID;
  String studentName;
  String className;
  String password;
  String account;

  Student({
    required this.studentID,
    required this.studentName,
    required this.className,
    required this.password,
    required this.account,
  });

  factory Student.fromJson(Map<dynamic, dynamic> json) {
    return Student(
      studentID: json['studentID'],
      studentName: json['studentName'],
      className: json['className'],
      password: json['password'],
      account: json['account'],
    );
  }

  get content => className+studentName+studentID.toString();

  Map<String, dynamic> toMap() {
    return {
      'studentID': studentID,
      'studentName': studentName,
      'className': className,
      'password': password,
      'account': account,
    };
  }
}

