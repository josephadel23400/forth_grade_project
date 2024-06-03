import 'package:clinic_project/constant.dart';
import 'package:clinic_project/controller/navigatorController.dart';
import 'package:clinic_project/services/settingService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatorBarPage extends StatelessWidget {
  final NavigatorController controller = Get.find();
  NavigatorBarPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    SettingServices share = Get.find();
    return GetBuilder(
        init: controller,
        builder: (controller) => Scaffold(
              body: controller.pages[controller.pageName],
              bottomNavigationBar: BottomNavigationBar(
                onTap: (value) {
                  controller.routingUpdate(value);
                },
                currentIndex: controller.pageName,
                fixedColor: Colors.black,
                items: [
                  const BottomNavigationBarItem(
                    label: "home",
                    activeIcon: Icon(
                      CupertinoIcons.house_fill,
                      color: Colors.black,
                    ),
                    icon: Icon(
                      CupertinoIcons.home,
                      color: Colors.black,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "medical record",
                    icon: ImageIcon(
                      AssetImage(kMedicalIcon),
                      color: Colors.black,
                    ),
                    activeIcon: ImageIcon(
                      AssetImage(kMedicalFilledIcon),
                      color: Colors.black,
                    ),
                  ),
                  const BottomNavigationBarItem(
                    label: "Book",
                    icon: Icon(
                      Icons.health_and_safety_outlined,
                      color: Colors.black,
                    ),
                    activeIcon: Icon(
                      Icons.health_and_safety,
                      color: Colors.black,
                    ),
                  ),
                  const BottomNavigationBarItem(
                    // New item for PatientProfile
                    label: "Profile",
                    icon: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.black,
                    ),
                    activeIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                   BottomNavigationBarItem(
                    label: "log Out",
                    icon: IconButton(
                      onPressed: () {
                        share.share.remove('id');
                        controller.user.signOut();
                        Get.offAllNamed('/');
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
