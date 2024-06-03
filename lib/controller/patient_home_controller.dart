import 'dart:async';

import 'package:clinic_project/services/settingService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/appointmentData.dart';
import '../model/doctor_Model.dart';

class PatientHomeController extends GetxController {

  SettingServices share = Get.find();

  bool hasAppointment = false;
  RxBool isNewAppointment = false.obs;

  RxBool isOldAppointment = false.obs;
  bool hadAppointment = false;
  DateTime current = DateTime.now();
  AppointmentData? nearestNew;
  AppointmentData? nearestOld;
  RxList<AppointmentData> appointments = <AppointmentData>[].obs;
  RxList<DoctorsModel> doctors = <DoctorsModel>[].obs;
  RxList<DoctorsModel> doctors1 = <DoctorsModel>[].obs;

  Future fetchAppointment() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('appointments')
        .where('patientId', isEqualTo: share.share.getString('uId'))
        .get();
    appointments.value = snapshot.docs.map((doc) {
      return AppointmentData.formJson(doc.id,doc.data());
    }).toList();
    print('\n\n\n\n ${appointments.length}');
  }

  Future fetchDoctorNew() async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection('doctors')
          .where('userId', isEqualTo: nearestNew!.doctorID)
          .get();
      doctors.value = snap.docs.map((doc) {
        return DoctorsModel.fromJson(doc.id,doc.data());
      }).toList();
      isNewAppointment.value = true;
    } catch (e) {
      isNewAppointment.value = false;
    }
  }

  Future fetchDoctorOld() async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection('doctors')
          .where('userId', isEqualTo: nearestOld!.doctorID)
          .get();
      doctors1.value = snap.docs.map((doc) {
        return DoctorsModel.fromJson(doc.id,doc.data());
      }).toList();
      isOldAppointment.value = true;
    } catch (e) {
      isOldAppointment.value = false;
    }
  }

  void nearestNewAppointment() {
    for (AppointmentData element in appointments) {
      DateTime appointmentDateTime = element.date.toDate();
      if (appointmentDateTime.isAfter(current)) {
        if (nearestNew == null ||
            appointmentDateTime.isBefore(nearestNew!.date.toDate())) {
          nearestNew = element;
        }
      }
    }

    if (nearestNew == null) {
      hasAppointment = false;
      print("No future appointments found.");
    } else {
      hasAppointment = true;
      update();
    }
  }

  void nearestOldAppointment() {
    for (AppointmentData element in appointments) {
      DateTime appointmentDateTime = element.date.toDate();
      if (appointmentDateTime.isBefore(current)) {
        if (nearestOld == null ||
            appointmentDateTime.isAfter(nearestOld!.date.toDate())) {
          nearestOld = element;
        }
      }
    }

    if (nearestOld == null) {
      hadAppointment = false;
      print("No future appointments found.");
    } else {
      hadAppointment = true;
      update();
    }
  }

  // void nearestNext(){
  //   appointment.forEach((date) {
  //     // Check if the timestamp is in the future (new)
  //     if (timestamp.isAfter(now)) {
  //       if (nearestNew == null || timestamp.difference(now) < nearestNew.difference(now)) {
  //         nearestNew = timestamp;
  //       }
  //     }
  // }

  // void isThereNext() {
  //   // Check if there are no doctors, then set isNewAppointment to true
  //   if (!doctors.isNotEmpty) {
  //     isNewAppointment.value = true;
  //   }
  // }
  //
  // void isThereOld() {
  //   // Check if there are no doctors1, then set isOldAppointment to true
  //   if (!doctors1.isNotEmpty) {
  //     isOldAppointment.value = true;
  //   }
  // }

  @override
  void onInit() async {
    await fetchAppointment();
    nearestNewAppointment();
    nearestOldAppointment();
    await fetchDoctorNew();
    await fetchDoctorOld();
    // TODO: implement onInit
    super.onInit();
  }
}
