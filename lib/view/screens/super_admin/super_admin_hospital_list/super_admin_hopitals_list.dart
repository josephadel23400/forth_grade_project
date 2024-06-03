import 'package:clinic_project/view/screens/patient/hospital_details.dart';
import 'package:clinic_project/view/screens/super_admin/super_admin_hospital_list/super_admin_hospital_details/super_admin_hospital_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constant.dart';
import '../../../../controller/hospitalController.dart';
import '../../../../model/hospital_model.dart';
import '../../../../services/settingService.dart';
import '../../../widget/customHeaderText.dart';
import '../../../widget/customScaffold.dart';
import '../../../widget/hospital_clinicDataContainer.dart';
import '../../patient/hospitalSpecialty.dart';

class SuperAdminHospitals extends StatelessWidget {
  const SuperAdminHospitals({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    SettingServices share = Get.find();
    HospitalController controller = Get.put(HospitalController());
    return CustomScaffold(showBack: true,widgetList: [
      SizedBox(
        height: screenHeight * .02,
      ),
      const CustomHeaderText(text: 'Hospitals'),
      SizedBox(
        height: screenHeight * .02,
      ),
      // GetBuilder<HospitalController>(
      //   init: controller,
      //   builder: (controller) => CustomListPicker(
      //       hint: 'Sort by',
      //       label: 'Type',
      //       icon: const Icon(Icons.sort_sharp),
      //       onChanged: (value) {},
      //       value: controller.dropDownValue,
      //       items: [
      //         DropdownMenuItem(
      //           value: 0,
      //           onTap: () {},
      //           child: const Text('Closest'),
      //         ),
      //         DropdownMenuItem(
      //           value: 1,
      //           onTap: () {},
      //           child: const Text('Random'),
      //         ),
      //         DropdownMenuItem(
      //           value: 2,
      //           onTap: () {},
      //           child: const Text('Random'),
      //         ),
      //         DropdownMenuItem(
      //           value: 3,
      //           onTap: () {},
      //           child: const Text('Government hospital'),
      //         ),
      //         DropdownMenuItem(
      //           value: 4,
      //           onTap: () {},
      //           child: const Text('Private hospital'),
      //         ),
      //       ]),
      // ),
      Obx(
        () => controller.hospitals.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: screenHeight * .545,
                child: ListView.builder(
                  itemCount: controller.hospitals.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    HospitalModel hospital = controller.hospitals[index];
                    return Hospital_ClincDataContaliner(
                      onTap: () {
                        share.share.setString('hospitalId',
                            controller.hospitals[index].hospitalId!);
                        share.share.setString(
                            'docId', controller.hospitals[index].docId!);
                        Get.to(
                          SuperAdminHospitalDetailsPage(hospital: hospital),
                        );
                      },
                      data: hospital,
                    );
                  },
                ),
              ),
      )
    ], imageName: kHospital);
  }
}
