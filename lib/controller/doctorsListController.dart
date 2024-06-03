import 'package:clinic_project/services/settingService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../model/doctor_Model.dart';

class DoctorsListController extends GetxController {
  SettingServices share = Get.find();
  RxList<DoctorsModel> doctors = <DoctorsModel>[].obs;
  void fetchDoctors() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .where('hospitalId', isEqualTo: share.share.getString('hospitalId'))
          .where('specialty', isEqualTo: share.share.getString('specialty'))
          .get();
      doctors.value = snapshot.docs.map((doc) {
        return DoctorsModel.fromJson(doc.id,doc.data());
      }).toList();
    } catch (error) {
      print('Error fetching doctors: $error');
      // Handle error (e.g., show error message)
    }
  }

  @override
  void onInit() {
    fetchDoctors();
    super.onInit();
  }
}
