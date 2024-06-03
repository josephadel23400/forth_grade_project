import 'package:clinic_project/model/hospital_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HospitalController extends GetxController {
  RxList<HospitalModel> hospitals = <HospitalModel>[].obs;


  // final hospitals = <DocumentSnapshot>[];
  int dropDownValue = 0;


  @override
  void onInit() {
    super.onInit();
    fetchHospitals();
  }

  void fetchHospitals() async {
    final snapshot =
    await FirebaseFirestore.instance.collection('hospitals').get();
    hospitals.value = snapshot.docs.map((doc) {
      return HospitalModel.fromJson(doc.id,doc.data());
    }).toList();
  }

}

