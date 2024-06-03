import 'package:clinic_project/constant.dart';
import 'package:clinic_project/services/settingService.dart';
import 'package:clinic_project/view/widget/customHeaderText.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:clinic_project/view/widget/dataTextDiscrition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/appointment_booking_controller.dart';
import '../../../controller/doctor_Time_Table.dart';

class BookAnAppointment extends StatelessWidget {
  const BookAnAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    BookAnAppointmentController controller =
        Get.put(BookAnAppointmentController());
    DoctorTimeTableController timeController = Get.find();
    SettingServices share = Get.find();
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
      widgetList: [
        SizedBox(
          height: screenHeight * .03,
        ),
        const CustomHeaderText(
          text: 'Book An Appointment',
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * .03),
          child: DataTextDescription(
            icon: CupertinoIcons.timer_fill,
            header: 'Doctor work time',
            text:
                '       Start in : ${share.share.getInt('startIn')}  and  End in : ${share.share.getInt('endIn')}',
          ),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * .03),
          child: Text(
            'Pick day',
            style:
                TextStyle(fontSize: screenHeight * .033, color: kMainFontBold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * .03),
          child: CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 2)),
            onDateChanged: (e) {
              controller.day = e;
            },
          ),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * .03),
          child: Text(
            'Pick time',
            style:
                TextStyle(fontSize: screenHeight * .033, color: kMainFontBold),
          ),
        ),
        CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hm,
          alignment: Alignment.center,
          itemExtent: 51,
          minuteInterval: 30,
          onTimerDurationChanged: (value) {
            controller.hM = value;
          },
          initialTimerDuration: Duration(hours: share.share.getInt('startIn')!),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * .03),
          child: Text(
            'make sure that the hour doses \'not\' conflict with doctor work time or with other appointment as shown in Doctor TimeTable ',
            style: TextStyle(
                fontSize: screenWidth * .05,
                color: CupertinoColors.black,
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * .03),
          child: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            onPressed: () async {
              if (controller.day == null || controller.hM == null) {
                Get.defaultDialog(
                  content: const Text('Please select date and time'),
                );
              } else {
                // Calculate the appointment datetime
                DateTime? appointmentDateTime =
                    controller.day!.add(controller.hM!);

                // Check if the appointment time is within doctor's working hours
                int startInHour = share.share.getInt('startIn')!;
                int endInHour = share.share.getInt('endIn')!;
                if (appointmentDateTime.hour < startInHour ||
                    appointmentDateTime.hour >= endInHour) {
                  appointmentDateTime = null;
                  Get.defaultDialog(
                    content: const Text(
                        'You picked a time when the doctor is not working'),
                  );
                } else if (appointmentDateTime.isBefore(DateTime.now())) {
                  appointmentDateTime = null;
                  Get.defaultDialog(
                    content: const Text(
                        'You cannot pick a time that has already passed'),
                  );
                } else {
                  // Check for conflicts with existing appointments
                  bool isAlreadyBooked = false;
                  for (int i = 0;
                      i < timeController.appointmentsData.length;
                      i++) {
                    DateTime existingAppointmentDateTime =
                        DateTime.fromMillisecondsSinceEpoch(
                      timeController.appointmentsData[i].date,
                    );
                    if (existingAppointmentDateTime == appointmentDateTime) {
                      isAlreadyBooked = true;
                      appointmentDateTime = null;
                      break;
                    }
                  }

                  if (isAlreadyBooked) {
                    Get.defaultDialog(content: const Text('Error'), actions: [
                      const Text(
                        'This appointment is already booked',
                      )
                    ]
                        // backgroundColor: Colors.red,
                        //duration: const Duration(seconds: 2),
                        );
                  } else {
                    // Add the new appointment
                    try {
                      await FirebaseFirestore.instance
                          .collection('appointments')
                          .add(
                        {
                          'patientId': share.share.getString('id'),
                          'doctorId': share.share.getString('doctorId'),
                          'date': Timestamp.fromDate(appointmentDateTime!),
                        },
                      );
                      Get.defaultDialog(
                        content: const Text('Appointment booked successfully'),
                      );
                    } catch (e) {
                      print('Error adding appointment: $e');
                      // Handle error adding appointment
                    }
                  }
                }
              }
            },
            child: Text(
              'Book an appointment',
              style: TextStyle(
                  fontSize: screenWidth * .05, color: CupertinoColors.white),
            ),
          ),
        ),
      ],
      imageName: kDoctorDetails,
    );
  }
}
