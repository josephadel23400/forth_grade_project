import 'package:clinic_project/view/screens/sup_admin/doctors_list/doctors_list_controller.dart';
import 'package:clinic_project/view/screens/sup_admin/sup_admin_home/sup_admin_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant.dart';
import '../../../../services/settingService.dart';
import '../../../widget/customHeaderText.dart';
import '../../../widget/customScaffold.dart';
import '../../../widget/customSpecialtyCard.dart';
import '../../patient/doctorsList.dart';

class HospitalDoctorsSpecialtyList extends StatelessWidget {
  const HospitalDoctorsSpecialtyList({
    super.key,
  });
  //Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    HospitalDoctorsSpecialtyListController controller = Get.find();
    SettingServices share = Get.find();
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
        showBack: true,
        back: false,
        onTap: () {
          Get.off(const SupAdminHome());
        },
        widgetList: [
          SizedBox(height: screenHeight * .02),
          const CustomHeaderText(text: 'Specialty'),
          SizedBox(height: screenHeight * .01),
          Padding(
            padding: EdgeInsets.all(screenWidth * .02),
            child: const Center(child: Text('Specialty')),
          ),
          Obx(
            () => controller.specialtyData.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.specialtyData[0].specialty == null
                    ? const Center(
                        child: Text('No doctors added yet'),
                      )
                    : SizedBox(
                        height: screenHeight * .545,
                        child: ListView.builder(
                          itemCount:
                              controller.specialtyData[0].specialty.length!,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            String key = controller
                                .specialtyData[0].specialty.keys
                                .elementAt(index)!;
                            return SpecialtyCard(
                              onTap: () {
                                share.share.setString('specialty', key);
                                share.share.setString('specialtyDoc',
                                    controller.specialtyData[0].docId);
                                share.share.setString(
                                    'hospitalId', share.share.getString('id')!);
                                Get.to(() => DoctorsList(isSupAdmin: true));
                              },
                              doctorCount: controller
                                  .specialtyData[0].specialty[key]!.length!,
                              name: key,
                            );
                          },
                        ),
                      ),
          ),
        ],
        imageName: kDoctor);
  }
}
