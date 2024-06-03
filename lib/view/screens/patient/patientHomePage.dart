import 'package:clinic_project/constant.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:clinic_project/view/widget/custom_no_data_text.dart';
import 'package:clinic_project/view/widget/cutomAppointmentContainer.dart';
import 'package:clinic_project/view/widget/smallSign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/patient_home_controller.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PatientHomeController controller =
        Get.put(PatientHomeController(), permanent: true);
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(height: screenHeight * .03),
      //title
      Row(
        children: [
          SizedBox(width: screenWidth * .04),
          Text(
            "Home",
            style: TextStyle(
                fontSize: screenWidth * .09,
                fontWeight: FontWeight.w700,
                color: kMainFontBold),
          ),
        ],
      ),
      SizedBox(height: screenHeight * .03),
      Obx(
        () => controller.doctors.isNotEmpty
            ? Stack(children: [
                Positioned(
                  child: CustomAppointmentContainer(
                    isPassed: false,
                    onTap: () {},
                    name: controller.doctors[0].name,
                    time: DateFormat('HH:mm')
                        .format(controller.nearestNew!.date.toDate()),
                    date: DateFormat('dd/MM/yyyy')
                        .format(controller.nearestNew!.date.toDate()),
                  ),
                ),
                Positioned(
                  right: screenWidth * .04,
                  bottom: 0,
                  child: CustomSmallSign(
                    choise1: 'new',
                    choise2: 'old',
                    isNew: true,
                    letterSpaceing: 1,
                  ),
                ),
              ])
            : controller.isNewAppointment.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const CustomNoDataText(text: 'there is no next appointments'),
      ),

      SizedBox(height: screenHeight * .03),
      Padding(
        padding: EdgeInsets.all(
          screenWidth * .02,
        ),
        child: Container(
          height: screenHeight * .001,
          color: CupertinoColors.black,
        ),
      ),
      SizedBox(height: screenHeight * .03),
      Obx(
        () => controller.doctors1.isNotEmpty
            ? Stack(children: [
                Positioned(
                  child: CustomAppointmentContainer(
                    isPassed: true,
                    onTap: () {},
                    name: controller.doctors1[0].name,
                    time: DateFormat('HH:mm')
                        .format(controller.nearestOld!.date.toDate()),
                    date: DateFormat('dd/MM/yyyy')
                        .format(controller.nearestOld!.date.toDate()),
                  ),
                ),
                Positioned(
                  right: screenWidth * .04,
                  bottom: 0,
                  child: CustomSmallSign(
                    choise1: 'new',
                    choise2: 'old',
                    isNew: false,
                    letterSpaceing: 3,
                  ),
                ),
              ])
            : controller.isOldAppointment.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const CustomNoDataText(text: 'there is no previous appointments'),
      )
    ], imageName: kDoctorHeart);
  }
}
