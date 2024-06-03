import 'package:clinic_project/constant.dart';
import 'package:clinic_project/services/settingService.dart';
import 'package:clinic_project/view/screens/sup_admin/hospital_profile/hospital_profile.dart';
import 'package:clinic_project/view/screens/sup_admin/sup_admin_home/widget/custom_sup_admin_container.dart';
import 'package:clinic_project/view/widget/customHeaderText.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_doctor/add_doctor.dart';

class SupAdminHome extends StatelessWidget {
  const SupAdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    SettingServices share = Get.find();
    FirebaseAuth user = FirebaseAuth.instance;
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .02,
      ),
      const CustomHeaderText(text: 'Home'),
      //hospital profile
      SupAdminContainer(
          onTap: () {
            Get.to(const HospitalProfile());
          },
          image: kHospital,
          header: 'Hospital Profile',
          text: 'you can check and update hospital details',
          icon: Icons.local_hospital),
      SizedBox(
        height: screenHeight * .02,
      ),
      //doctors list
      SupAdminContainer(
          onTap: () {
            Get.toNamed('/sup_admin_doctors_specialty');
          },
          image: kDoctors,
          header: 'Doctors List',
          text: 'you can check doctors in your hospital',
          icon: CupertinoIcons.heart_fill),
      SizedBox(
        height: screenHeight * .02,
      ),
      //add doctor
      SupAdminContainer(
          onTap: () {
            Get.to(const AddNewDoctor());
          },
          image: kDoctorNurse,
          header: 'Add a new Doctor',
          text: 'you can add a new doctor for your hospital',
          icon: CupertinoIcons.folder_fill_badge_plus),
      SizedBox(
        height: screenHeight * .02,
      ),
      //log out
      SupAdminContainer(
        onTap: () async {
          share.share.remove('id');
          await user.signOut();
          Get.offAllNamed('/');
        },
        image: kGoodBye,
        header: 'Log Out',
        text: 'Log out from this account',
        icon: Icons.logout,
      ),
      SizedBox(
        height: screenHeight * .02,
      ),
    ], imageName: kHospital);
  }
}
