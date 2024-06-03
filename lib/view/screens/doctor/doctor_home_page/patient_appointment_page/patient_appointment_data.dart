import 'package:clinic_project/model/appointmentData.dart';
import 'package:clinic_project/model/patientData.dart';
import 'package:clinic_project/view/screens/doctor/doctor_home_page/doctor_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../constant.dart';
import '../../../../widget/customHeaderText.dart';
import '../../../../widget/customScaffold.dart';
import '../../../../widget/dataTextDiscrition.dart';
import '../../../../widget/personInformation.dart';

class AppointmentPatientData extends StatelessWidget {
  AppointmentPatientData(
      {super.key, required this.patientData, required this.appointmentData});
  PatientData patientData;
  AppointmentData appointmentData;
  @override
  Widget build(BuildContext context) {
    DoctorHomeController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
        showBack: true,
        widgetList: [
          SizedBox(
            height: screenHeight * .03,
          ),
          const CustomHeaderText(text: 'Appointment Details'),
          PersonInformationCard(
            gender: patientData.gender,
            header1: 'Name',
            header2: 'Age',
            icon1: Icons.person_outline_outlined,
            icon2: Icons.numbers,
            text1: patientData.name,
            text2: patientData.age.toString(),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * .025),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * .01,
                ),
                DataTextDescription(
                  icon: patientData.gender ? Icons.male : Icons.female,
                  text: patientData.gender ? 'male' : 'female',
                  header: 'Gender',
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                DataTextDescription(
                  icon: Icons.date_range,
                  text: DateFormat('dd/MM/yyyy')
                      .format(appointmentData.date.toDate()),
                  header: 'Date',
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                DataTextDescription(
                  icon: Icons.access_time_outlined,
                  text:
                      DateFormat('HH:mm').format(appointmentData.date.toDate()),
                  header: 'Time',
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                GetBuilder(
                    init: controller,
                    builder: (controller) => DataTextDescription(
                          function: () {
                            controller.updateNote();
                            controller.update();
                            controller.onInit();
                          },
                          showIcon: true,
                          icon: Icons.note_alt_outlined,
                          text: appointmentData.note ??
                              'please add note after you finish the appointment',
                          header: 'Appointment Note',
                        )),
                DataTextDescription(
                  icon: Icons.note_alt_outlined,
                  text: patientData.medicalNote ?? 'there is no note add',
                  header: 'Patient Personal Note',
                ),
              ],
            ),
          )
        ],
        imageName: kDoctorDetails);
  }
}
