import 'package:get/get.dart';

class Hospital_ClincDataContalinerController extends GetxController {
  bool isOpen(int closeHour) {
    if (DateTime.now().hour -closeHour < 0) {
      return true;
    } else {
      return false;
    }
  }
}
