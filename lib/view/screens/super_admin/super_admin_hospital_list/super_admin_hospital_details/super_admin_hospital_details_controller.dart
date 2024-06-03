import 'package:clinic_project/services/settingService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SuperAdminHospitalController extends GetxController {
  SettingServices share = Get.find();
  List<String> stringList = [];
  Future<void> deleteHospital() async {
    //delete from hospitals
    await FirebaseFirestore.instance
        .collection('hospitals')
        .doc(share.share.getString('docId'))
        .delete();
    //delete from role
    final snap = await FirebaseFirestore.instance
        .collection('role')
        .where(share.share.getString('hospitalId')!)
        .get();
    final gg = snap.docs;
    String docId = gg[0].id;
    await FirebaseFirestore.instance.collection('role').doc(docId).delete();
    //delete from specialty
    final snap1 = await FirebaseFirestore.instance
        .collection('specialty')
        .where(share.share.getString('hospitalId')!)
        .get();

    final gg2 = snap1.docs;
    String docId1 = gg2[0].id;
    await FirebaseFirestore.instance
        .collection('specialty')
        .doc(docId1)
        .delete();
  }
}
