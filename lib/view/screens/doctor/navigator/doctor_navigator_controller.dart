import 'package:clinic_project/services/settingService.dart';
import 'package:clinic_project/view/screens/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../doctor_home_page/doctorHome.dart';
import '../doctor_profile/doctor_profile.dart';

class DoctorNavigatorController extends GetxController {
  final user = FirebaseAuth.instance;
  SettingServices share = Get.find();
  int page = 0;
  List<Widget> pages = [
    const DoctorHome(),
    const DoctorProfile(),
    const LogInPage(),
  ];
  void routingUpdate(int value) {
    page = value;
    update();
  }
}
