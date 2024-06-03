
import 'package:clinic_project/constant.dart';
import 'package:clinic_project/model/appointmentData.dart';
import 'package:clinic_project/model/doctor_Model.dart';
import 'package:clinic_project/view/widget/customHeaderText.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:clinic_project/view/widget/dataTextDiscrition.dart';
import 'package:clinic_project/view/widget/personInformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/patientMadicalRecordController.dart';
import 'hospital_details.dart';

class PatientAppointmentPage extends StatelessWidget {
  const PatientAppointmentPage(
      {super.key, required this.dData, required this.aData});
  final DoctorsModel dData;
  final AppointmentData aData;
  @override
  Widget build(BuildContext context) {
    PatientMedialRecordController controller =
        Get.put(PatientMedialRecordController());
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
            gender: dData.gender,
            header1: 'Name',
            header2: 'Speciality',
            icon1: Icons.person_outline_outlined,
            icon2: Icons.medical_information_outlined,
            text1: dData.name,
            text2: dData.specialty,
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * .025),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * .01,
                ),
                DataTextDescription(
                  icon: Icons.date_range,
                  text: DateFormat('dd/MM/yyyy').format(aData.date.toDate()),
                  header: 'Date',
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                DataTextDescription(
                  icon: Icons.access_time_outlined,
                  text: DateFormat('HH:mm').format(aData.date.toDate()),
                  header: 'Time',
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: DataTextDescription(
                        icon: Icons.local_hospital_outlined,
                        text: controller.hospital.value?.name ??
                            'No hospital available',
                        header: 'Hospital',
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * .12,
                      child: IconButton(
                        onPressed: () {
                          Get.to(HospitalDetailsPage(
                            hospital: controller.hospital.value!,
                          ));
                        },
                        icon: const Icon(
                          CupertinoIcons.home,
                          //size: screenWidth * .12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                DataTextDescription(
                  icon: Icons.note_alt_outlined,
                  text: aData.note ?? 'there is no note add',
                  header: 'Note',
                ),
              ],
            ),
          )
        ],
        imageName: kDoctorDetails);
  }
}
