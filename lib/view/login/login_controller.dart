import 'package:get/get.dart';

class LogInController extends GetxController {
  RxInt pageNum=0.obs;
  //Get.update;
  bool isSecure = true;
  void showPassword() {
    isSecure = !isSecure;
    update();
  }
}