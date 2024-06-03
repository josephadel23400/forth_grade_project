import 'package:clinic_project/controller/CustomDataContainerController.dart';
import 'package:get/get.dart';

import '../controller/navigatorController.dart';

class NavigatorBinding implements Bindings{
  @override
  void dependencies() {

    Get.put(CustomDataContainerController(),);
    Get.put(NavigatorController(),);
    //Get.lazyPut(() => PatientMedialRecordController(),fenix:true);
    // TODO: implement dependencies
  }
}