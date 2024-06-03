
import 'package:clinic_project/constant.dart';
import 'package:clinic_project/services/settingService.dart';
import 'package:clinic_project/view/screens/patient/hospitalSpecialty.dart';
import 'package:clinic_project/view/widget/customHeaderText.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:clinic_project/view/widget/hospital_clinicDataContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/hospitalController.dart';
import '../../../model/hospital_model.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    SettingServices share= Get.find();
    HospitalController controller = Get.put(HospitalController());
    return CustomScaffold(widgetList: [
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
                        share.share.setString('hospitalId', controller.hospitals[index].hospitalId!);
                        Get.to(const HospitalSpecialties());
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
