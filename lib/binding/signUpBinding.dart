import 'package:clinic_project/controller/sginUpController.dart';
import 'package:get/get.dart';

class SingUpBinding implements Bindings{
  @override
  void dependencies() {

    Get.put(SignUpController(),permanent: true);
  }
}