import 'package:clinic_project/view/screens/sup_admin/doctors_list/doctors_list_controller.dart';
import 'package:get/get.dart';

class HospitalDoctorsSpecialtyListBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HospitalDoctorsSpecialtyListController());
  }
}
