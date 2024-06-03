import 'package:clinic_project/controller/logInController.dart';
import 'package:get/get.dart';

class LogInBinding implements Bindings{
  @override
  void dependencies() {

    Get.put(LogInPageController(),permanent: true);
    // TODO: implement dependencies
  }
}