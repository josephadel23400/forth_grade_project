import 'package:clinic_project/constant.dart';
import 'package:clinic_project/view/screens/doctor/doctor_home_page/patient_appointment_page/patient_appointment_data.dart';
import 'package:clinic_project/view/screens/doctor/doctor_home_page/widget/data_container_patient.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/customHeaderText.dart';
import 'doctor_home_controller.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorHomeController controller = Get.put(DoctorHomeController(),permanent: false);
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(height: screenHeight * .02),
      const CustomHeaderText(
        text: 'Doctor Home',
      ),
      SizedBox(height: screenHeight * .02),
      Obx(
        () {
          if (controller.appointments.isNotEmpty) {
            if (controller.patients.length == controller.appointments.length &&
                controller.appointments.isNotEmpty) {
              return SizedBox(
                height: screenHeight * 0.8,
                child: ListView.builder(
                    itemCount: controller.appointments.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * .01),
                        child: PatientDataContainer(
                          appointmentData: controller.appointments[index],
                          patientData: controller.patients[index],
                          onTap: () {
                            controller.share.share.setString(
                                'docId', controller.appointments[index].docId);
                            print(
                                '\n\n ${controller.share.share.getString('docId')} \n\n ');
                            Get.to(AppointmentPatientData(
                              patientData: controller.patients[index],
                              appointmentData: controller.appointments[index],
                            ));
                          },
                        ),
                      );
                    }),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return Center(
              child: Text(
                'there is no appointments booked',
                style: TextStyle(fontSize: screenHeight * .035),
              ),
            );
          }
        },
      ),
    ], imageName: kDoctorNurse);
  }
}
