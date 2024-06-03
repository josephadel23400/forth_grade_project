import 'package:clinic_project/view/screens/loginPage.dart';
import 'package:clinic_project/view/screens/patient/patientProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../view/screens/patient/bookingPage.dart';
import '../view/screens/patient/patientHomePage.dart';
import '../view/screens/patient/patientMadicalRecord.dart';

class NavigatorController extends GetxController {
  final user = FirebaseAuth.instance;

  int pageName = 0;

  List<Widget> pages = [
    const PatientHomePage(),
    const PatientMedicalRecord(),
    const BookingPage(),
    const PatientProfile(),
    const LogInPage(),
  ];
  void routingUpdate(int value) {
    pageName = value;
    update();
  }
}
