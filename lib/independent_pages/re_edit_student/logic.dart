import 'package:get/get.dart';
import 'package:manger_system/model/student.dart';

import '../../method.dart';

class ReEditStudentLogic extends GetxController {
  Student student = Student.fromJson(box.read('temp'));
}
