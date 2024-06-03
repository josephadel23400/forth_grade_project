import 'package:clinic_project/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'doctor_navigator_controller.dart';

class DoctorNavigator extends StatelessWidget {
  const DoctorNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorNavigatorController controller = Get.put(DoctorNavigatorController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return GetBuilder(
      init: controller,
      builder: (controller) => Scaffold(
        body: controller.pages[controller.page],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            controller.routingUpdate(value);
            controller.update();
          },
          enableFeedback: true, showUnselectedLabels: false,
          currentIndex: controller.page,
          fixedColor: Colors.black,
          //backgroundColor: kMainColor,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart),
              activeIcon: Icon(CupertinoIcons.heart_solid),
              label: 'Patients',
            ),
            const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_circle),
              activeIcon: Icon(CupertinoIcons.person_circle_fill),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                alignment: Alignment.center,
                iconSize: screenHeight * .028,
                onPressed: () async {
                  controller.share.share.remove('id');
                  await controller.user.signOut();
                  Get.offAllNamed('/');
                },
                icon: const Icon(Icons.logout),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
