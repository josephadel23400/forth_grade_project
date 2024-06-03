import 'package:clinic_project/services/settingService.dart';
import 'package:clinic_project/view/widget/customHeaderText.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant.dart';

import '../../../controller/hospital_specialties_controller.dart';
import '../../widget/customSpecialtyCard.dart';
import 'doctorsList.dart';

class HospitalSpecialties extends StatelessWidget {
  const HospitalSpecialties({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HospitalSpecialtiesController controller =
        Get.put(HospitalSpecialtiesController());
    ;
    SettingServices share = Get.find();
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
        showBack: true,
        widgetList: [
          SizedBox(height: screenHeight * .02),
          const CustomHeaderText(text: 'Specialty'),
          SizedBox(height: screenHeight * .01),
          Padding(
            padding: EdgeInsets.all(screenWidth * .02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: screenWidth * .3,
                  ),
                ),
                const Text('Specialty'),
                const Text('Doctor Available'),
              ],
            ),
          ),
          Obx(() {
            if (controller.hospitalSpecialties.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return SizedBox(
              height: screenHeight * .545,
              child: ListView.builder(
                  itemCount: controller.hospitalSpecialties[0].specialty.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    String key = controller
                        .hospitalSpecialties[0].specialty.keys
                        .elementAt(index);
                    return SpecialtyCard(
                      onTap: () {
                        share.share.setString('specialty', key);
                        share.share.setString('hospitalId',
                            controller.hospitalSpecialties[0].hospitalId);
                        print(controller.hospitalSpecialties[0].hospitalId);
                        Get.to(() => DoctorsList());
                      },
                      doctorCount: controller
                          .hospitalSpecialties[0].specialty[key]!.length,
                      name: key,
                    );
                  }),
            );
          }),
        ],
        imageName: kDoctor);
  }
}
