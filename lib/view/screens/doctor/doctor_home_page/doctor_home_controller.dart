import 'package:clinic_project/model/appointmentData.dart';
import 'package:clinic_project/model/patientData.dart';
import 'package:clinic_project/services/settingService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DoctorHomeController extends GetxController {
  SettingServices share = Get.find();
  DateTime current = DateTime.now();
  RxList<AppointmentData> appointments = <AppointmentData>[].obs;
  RxList<PatientData> patients = <PatientData>[].obs;
  Future<void> fetchAppointment() async {
    try {
      current = current.subtract(const Duration(minutes: 30));
      final snapshot = await FirebaseFirestore.instance
          .collection('appointments')
          .where('doctorId', isEqualTo: share.share.getString('id')!)
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(current))
          .get();
      appointments.value = snapshot.docs
          .map((e) => AppointmentData.formJson(e.id, e.data()))
          .toList();
      //print('${appointments.length} \n');
      //print('${appointments[0]}\n');
      //print('${appointments[1]}\n');
      if (appointments.length > 1) {
        appointments.sort((a, b) => a.date.compareTo(b.date));
      }

      //List<String> docIds = appointments.map((appointment) => appointment.docId).toList();
      //print('Sorted Appointment DocIds: $docIds');
      //print(appointments.length);
      //print('${appointments[0]}\n');
      //print('${appointments[1]}\n');
      if (appointments.isNotEmpty) {
        await fetchPatients();
      }
    } catch (e) {
      print('\n error : $e \n');
    }
  }

  void updateNote() async {
    String note = share.share.getString('val')!;
    await FirebaseFirestore.instance
        .collection('appointments')
        .doc(share.share.getString('docId'))
        .update({
      'note': note,
    });
  }

  Future<void> fetchPatients() async {
    try {
      patients.clear();
      //print('\n ${appointments[0].patientId}');
      for (int i = 0; i < appointments.length; i++) {
        final snap = await FirebaseFirestore.instance
            .collection('users')
            .where('userId', isEqualTo: appointments[i].patientId)
            .get();
        final fetchedPatients = snap.docs.map((doc) {
          return PatientData.fromJson(doc.data());
        }).toList();
        patients.addAll(fetchedPatients); // Add fetched doctors to the list
        print('\n fetched \n');
      }
    } catch (e) {
      print('\n $e \n');
    }
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    await fetchAppointment();
    super.onInit();
  }
}
