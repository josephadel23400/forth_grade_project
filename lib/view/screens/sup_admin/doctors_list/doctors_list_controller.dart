import 'package:clinic_project/services/settingService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../model/specialty_model.dart';

class HospitalDoctorsSpecialtyListController extends GetxController {
  SettingServices share = Get.find();
  RxList<SpecialtyModel> specialtyData = <SpecialtyModel>[].obs;
  Future fetchHospitals() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('specialty')
        .where('hospitalId', isEqualTo: share.share.getString('id'))
        .get();
    specialtyData.value = snapshot.docs.map((doc) {
      return SpecialtyModel.fromJson(doc.id, doc.data());
    }).toList();
  }

  @override
  void onInit() async {
    await fetchHospitals();
    // TODO: implement onInit
    super.onInit();
  }
}
