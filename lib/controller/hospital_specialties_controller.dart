import 'package:clinic_project/services/settingService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/specialty_model.dart';

class HospitalSpecialtiesController extends GetxController {
  SettingServices share = Get.find();
  RxList<SpecialtyModel> hospitalSpecialties = <SpecialtyModel>[].obs;
  Future<void> fetchSpecialties() async {
    try {
      print(share.share.getString('hospitalId'));
      final snap = await FirebaseFirestore.instance
          .collection('specialty')
          .where('hospitalId', isEqualTo: share.share.getString('hospitalId')!)
          .get();
      hospitalSpecialties.value = snap.docs
          .map((e) => SpecialtyModel.fromJson(e.id, e.data()))
          .toList();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    await fetchSpecialties();
    // TODO: implement onInit
    super.onInit();
  }
}
