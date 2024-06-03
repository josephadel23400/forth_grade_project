import 'package:clinic_project/services/settingService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoctorDetailsController extends GetxController {
  SettingServices share = Get.find();
  Future<void> deleteDoctor() async {
    try {
      await FirebaseFirestore.instance
          .collection('doctors')
          .doc(share.share.getString('docId'))
          .delete();
      final snapShot = await FirebaseFirestore.instance
          .collection('role')
          .where('id', isEqualTo: share.share.getString('deletedDoctorId'))
          .get();
      String docId = snapShot.docs[0].id;
      await FirebaseFirestore.instance.collection('role').doc(docId).delete();
      final snap = await FirebaseFirestore.instance
          .collection('appointments')
          .where('doctorId',
              isEqualTo: share.share.getString('deletedDoctorId'))
          .get();
      RxList<String> appointmentsDocID = <String>[].obs;
      for (int i = 0; i < snap.docs.length; i++) {
        appointmentsDocID.add(snap.docs[i].id);
      }
      for (int i = 0; i < appointmentsDocID.length; i++) {
        await FirebaseFirestore.instance
            .collection('appointments')
            .doc(appointmentsDocID[i])
            .delete();
      }
      print('\n ${share.share.getString('specialty')} \n ');
      print('\n ${share.share.getInt('arrayNumber')} \n ');

      final newDoctorSpecialty = await FirebaseFirestore.instance
          .collection('specialty')
          .where('hospitalId', isEqualTo: share.share.getString('id'))
          .get();
      final doc = newDoctorSpecialty.docs.first;

      DocumentReference specialtyRef =
          FirebaseFirestore.instance.collection('specialty').doc(doc.id);
      Map<String, dynamic> data = doc.data();
      dynamic specialtyData = data['specialty'];
      specialtyData ??= {};
      dynamic doctors = specialtyData[share.share.getString('specialty')!];
      doctors ??= [];
      doctors.removeAt(share.share.getInt('arrayNumber'));
      //data.remove(share.share.getInt('arrayNumber')!);
      //data.remove(share.share.getString('specialty')!);
      specialtyData[share.share.getString('specialty')!] = doctors;
      await specialtyRef.update({'specialty': specialtyData});
      print('doctor Deleted Successfully');
    } catch (e) {
      print(e);
    }
  }
}
