import 'package:clinic_project/model/appointmentData.dart';
import 'package:clinic_project/model/doctor_Model.dart';
import 'package:clinic_project/view/screens/patient/appointmentPagePatient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/patientMadicalRecordController.dart';
import 'customDataContainer.dart';

class CustomListViewData extends StatelessWidget {
  const CustomListViewData({super.key, required this.aData, required this.dData});

  final DoctorsModel dData;
  final AppointmentData aData;
  @override
  Widget build(BuildContext context) {
    PatientMedialRecordController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Column(
      children: [
        CustomDataContainer(
          gender: dData.gender,
          photo: dData.photo,
          date: DateFormat('dd/MM/yyyy')
              .format(aData.date.toDate()),
          name: dData.name,
          specialty: dData.specialty,
          onTap: () async {
            await controller.fetchHospital(dData.hospitalId);
            Get.to(PatientAppointmentPage(
              aData: aData,
              dData: dData,
            ));
          },
        ),
        SizedBox(height: screenHeight * .015),
      ],
    );
  }
}
