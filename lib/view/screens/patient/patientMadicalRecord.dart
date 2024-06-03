import 'package:clinic_project/constant.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:clinic_project/view/widget/custom_data_view_for_listview.dart';
import 'package:clinic_project/view/widget/custom_no_data_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/patientMadicalRecordController.dart';

class PatientMedicalRecord extends StatelessWidget {
  const PatientMedicalRecord({super.key});

  @override
  Widget build(BuildContext context) {
    PatientMedialRecordController controller =
        Get.put(PatientMedialRecordController());
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
            "Medical Record",
            style: TextStyle(
                fontSize: screenWidth * .09,
                fontWeight: FontWeight.w700,
                color: kMainFontBold),
          ),
        ],
      ),
      //SizedBox(height: screenHeight * .03),
      SizedBox(
        height: screenHeight * .66,
        width: screenWidth ,
        child: Obx(
          () {
            final appointmentsLength =
                controller.controller.appointments.length;
            final doctorsLength = controller.doctors.length;

            // Check if both lists have the same length and are not empty
            if (appointmentsLength == doctorsLength && appointmentsLength > 0) {
              return ListView.builder(
                itemCount: appointmentsLength,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  // Check if the index is within bounds
                  if (index < appointmentsLength && index < doctorsLength) {
                    return CustomListViewData(
                      dData: controller.doctors[index],
                      aData: controller.controller.appointments[index],
                    );
                  } else {
                    // Handle the case where the index is out of bounds
                    return const SizedBox(); // Or any other fallback widget
                  }
                },
              );
            } else if (appointmentsLength == 0 && doctorsLength == 0) {
              // If both lists are empty, show the message
              return const Center(
                child: CustomNoDataText(
                  text: 'There are no provided appointments.',
                ),
              );
            } else {
              // If either list is empty or their lengths don't match, show a loading indicator
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    ], imageName: kDoctorDetails);
  }
}
