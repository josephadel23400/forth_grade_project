import 'package:clinic_project/controller/patient_home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/doctor_Model.dart';
import '../model/hospital_model.dart';

class PatientMedialRecordController extends GetxController {
  PatientHomeController controller = Get.find();
  RxList<DoctorsModel> doctors = <DoctorsModel>[].obs;
  Rx<HospitalModel?> hospital = Rx<HospitalModel?>(null);

  Future fetchDoctors() async {
    try {
      for (int i = 0; i < controller.appointments.length; i++) {
        final snap = await FirebaseFirestore.instance
            .collection('doctors')
            .where('userId', isEqualTo: controller.appointments[i].doctorID)
            .get();
        final fetchedDoctors = snap.docs.map((doc) {
          return DoctorsModel.fromJson(doc.id, doc.data());
        }).toList();
        doctors.addAll(fetchedDoctors); // Add fetched doctors to the list
        print('\n fetched \n');
      }
    } catch (e) {
      print('\n $e \n');
    }
  }

  Future fetchHospital(String hospitalID) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('hospitals')
          .where('hospitalId', isEqualTo: hospitalID)
          .get();
      if (snapshot.docs.isNotEmpty) {
        // Use snapshot.docs.first.data() to access the data of the first document in the snapshot
        //لو في ايرور يبقي هنا
        hospital.value = HospitalModel.fromJson(
            snapshot.docs.first.id, snapshot.docs.first.data());
      } else {
        hospital.value = null;
      }
      if (hospital.value != null) {
        print('\n\n ${hospital.value!.name} \n\n');
      } else {
        print('\n\n Hospital not found \n\n');
      }
    } catch (e) {
      print('\n\n $e \n\n');
    }
  }

  @override
  void onInit() async {
    await fetchDoctors();
    // TODO: implement onInit
    super.onInit();
  }
}
