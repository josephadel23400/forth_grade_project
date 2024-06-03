import 'package:clinic_project/constant.dart';
import 'package:clinic_project/view/widget/customHeaderText.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_planner/time_planner.dart';

import '../../../controller/doctor_Time_Table.dart';
import 'book_an_appointment.dart';

class DoctorTimeTable extends StatelessWidget {
  const DoctorTimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorTimeTableController controller = Get.put(DoctorTimeTableController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .02,
      ),
      const CustomHeaderText(text: 'Create Appointment'),
      SizedBox(
        height: screenHeight * .02,
      ),
      SizedBox(
        height: screenHeight * .55,
        child: Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: Obx(
            () {
              if (controller.fetched.value) {
                return TimePlanner(
                  // time will be start at this hour on table
                  startHour: 6,
                  // time will be end at this hour on table
                  endHour: 23,
                  // each header is a column and a day
                  headers: [
                    TimePlannerTitle(
                      date: controller.nextThreeDaysNumbers[0],
                      title: controller.nextThreeDays[0],
                    ),
                    TimePlannerTitle(
                      date: controller.nextThreeDaysNumbers[1],
                      title: controller.nextThreeDays[1],
                    ),
                    TimePlannerTitle(
                      date: controller.nextThreeDaysNumbers[2],
                      title: controller.nextThreeDays[2],
                    ),
                  ],
                  // List of task will be show on the time planner
                  tasks: controller.appointments,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(screenWidth * .03),
        child: FloatingActionButton(backgroundColor:Colors.blueAccent ,
          onPressed: () {
            Get.to(BookAnAppointment());
          },
          child: Text(
            'Book an appointment',
            style: TextStyle(
                fontSize: screenWidth * .05, color: CupertinoColors.white),
          ),
        ),
      ),
    ], imageName: kDoctorNurse);
  }
}
