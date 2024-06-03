import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../services/settingService.dart';

class LogInPageController extends GetxController {
  SettingServices share = Get.find();
  final user = FirebaseAuth.instance;
  String? email;
  String? password;

  Future<void> logIn() async {
    try {
      await user.signInWithEmailAndPassword(email: email!, password: password!);
      await share.share.setString('uId', user.currentUser!.uid);
    } catch (e) {
      print(' $e ');
    }
  }

  Future<void> role() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('role')
          .where('id', isEqualTo: share.share.getString('uId')).get();
      if (snapshot.docs.isNotEmpty) {
        share.share.setString('role', snapshot.docs[0].data()['role']);
      }
    } catch (e) {
      print(' $e ');
    }
  }

  bool isSecure = false;

  // Constructor to receive screen size

  void showPassword() {
    isSecure = !isSecure;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
