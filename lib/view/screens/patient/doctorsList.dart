import 'package:clinic_project/controller/doctorsListController.dart';
import 'package:clinic_project/services/settingService.dart';
import 'package:clinic_project/view/screens/patient/doctorTimeTable.dart';
import 'package:clinic_project/view/widget/doctorDataContainer.dart';
import 'package:flutter/material.dart';
import 'package:clinic_project/constant.dart';
import 'package:clinic_project/view/widget/customHeaderText.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:get/get.dart';

import '../../../controller/logInController.dart';
import '../sup_admin/doctors_list/doctor_data/doctor_details.dart';
import '../sup_admin/sup_admin_home/sup_admin_home.dart';

class DoctorsList extends StatelessWidget {
  DoctorsList({super.key, this.isSupAdmin = false});
  bool isSupAdmin;
  @override
  Widget build(BuildContext context) {
    DoctorsListController controller = Get.put(DoctorsListController());
    LogInPageController cc = Get.find();
    SettingServices share = Get.find();
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
      showBack: true,
      onTap: () {
        Get.to(SupAdminHome());
      },
      widgetList: [
        SizedBox(
          height: screenHeight * .02,
        ),
        const CustomHeaderText(text: 'Doctors'),
        Obx(
          () => controller.doctors.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  height: screenHeight * .67,
                  width: screenWidth * .02,
                  child: ListView.builder(
                    itemCount: controller.doctors.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return DoctorDataContainer(
                        data: controller.doctors[index],
                        onTap: () {
                          share.share.setInt('arrayNumber', index);
                          share.share.setString(
                              'docId', controller.doctors[index].docId);
                          share.share.setString('deletedDoctorId',
                              controller.doctors[index].userId);
                          if (isSupAdmin) {
                            Get.to(DoctorDetailsPage(
                              dData: controller.doctors[index],
                            ));
                          } else {
                            print(cc.user.currentUser!.uid);
                            share.share.setInt(
                                'startIn', controller.doctors[index].startIn);
                            share.share.setInt(
                                'endIn', controller.doctors[index].endIn);
                            share.share.setString(
                                'doctorId', controller.doctors[index].userId);
                            Get.to(const DoctorTimeTable());
                          }
                        },
                      );
                    },
                  ),
                ),
        ),
      ],
      imageName: kDoctor,
    );
  }
}
