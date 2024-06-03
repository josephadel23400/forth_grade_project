import 'package:clinic_project/constant.dart';
import 'package:clinic_project/services/settingService.dart';
import 'package:clinic_project/view/screens/sup_admin/sup_admin_home/widget/custom_sup_admin_container.dart';
import 'package:clinic_project/view/widget/customHeaderText.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../super_admin_add_hospital/super_admin_add_hospital.dart';
import '../super_admin_hospital_list/super_admin_hopitals_list.dart';

class SuperAdminHome extends StatelessWidget {
  const SuperAdminHome({super.key});

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
      //show hospitals
      SupAdminContainer(
          onTap: () {
            Get.to(const SuperAdminHospitals());
          },
          image: kHospital,
          header: 'Hospitals List',
          text: 'you can check and delete hospitals ',
          icon: Icons.local_hospital),
      SizedBox(
        height: screenHeight * .02,
      ),
      //add hospital
      SupAdminContainer(
          onTap: () {
            Get.to(const SuperAdminAddHospital());
          },
          image: kHospital,
          header: 'Add Hospital',
          text: 'you can add a new hospital',
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
