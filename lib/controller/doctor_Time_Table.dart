import 'package:clinic_project/services/settingService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_planner/time_planner.dart';
import '../model/appointmentData.dart';

class DoctorTimeTableController extends GetxController {
  DateTime current = DateTime.now();
  RxBool fetched = false.obs;
  SettingServices share = Get.find();

  List<String> daysOfWeek = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  List<String> nextThreeDays = [];

  List<String> nextThreeDaysNumbers = [];

  List<Map<String, int>> startEndMin = [];

  void workTimeOver(int startIn, int endIn) {
    print('\n workTimeOver \n');

    int mintStart = 0;
    int mintEnd = 0;
    if (startIn > 6) {
      mintStart = (startIn - 6) * 60;
    }
    if (endIn < 24) {
      mintEnd = (24 - endIn) * 60;
    }
    startEndMin.add({'start': mintStart, 'end': mintEnd});
  }

  void startEndForThreeTime() {
    print('\n startEndForThreeTime \n');
    for (int i = 0; i < 3; i++) {
      // int start = startEnd[i]['start'] ?? 0; // Use null check operator to handle potential null value
      // int end = startEnd[i]['end'] ?? 0; // Use null check operator to handle potential null value
      workTimeOver(
          share.share.getInt('startIn') ?? 0, share.share.getInt('endIn') ?? 0);
    }
    print(startEndMin);
  }

  void nextThreeDay() {
    print('\n nextThreeDay \n');
    int dayOfWeekIndex = current.weekday;

    for (int i = 0; i < 3; i++) {
      DateTime nextDate = current.add(Duration(days: i));
      String formattedDate = DateFormat('MM/dd/yyyy').format(nextDate);
      int index = (dayOfWeekIndex + i) % 7;
      nextThreeDays.add(daysOfWeek[index]);
      nextThreeDaysNumbers.add(formattedDate);
    }
  }

  List<TimePlannerTask> appointments = [];

  RxList<AppointmentData> appointmentsData = <AppointmentData>[].obs;
  void dayWorkTime() {
    print('\n\n\n\n');
    for (int i = 0; i < 3; i++) {
      appointments.add(TimePlannerTask(
        color: Colors.red,
        dateTime: TimePlannerDateTime(day: i, hour: 6, minutes: 0),
        minutesDuration: startEndMin[i]['start']!,
        child: const Text(
          'work time is over',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
      ));
      appointments.add(TimePlannerTask(
        color: Colors.red,
        dateTime: TimePlannerDateTime(
            day: i, hour: share.share.getInt('endIn')!, minutes: 0),
        minutesDuration: startEndMin[i]['end']!,
        child: const Text(
          'work time is over',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
      ));
    }
  }

  Future<void> fetchAppointment() async {
    try {
      print('\n fetchAppointment \n');
      final snapshot = await FirebaseFirestore.instance
          .collection('appointments')
          .where('date',
              isGreaterThanOrEqualTo: Timestamp.fromDate(current),
              isLessThan:
                  Timestamp.fromDate(current.add(const Duration(days: 3))))
          .where('doctorId', isEqualTo: share.share.getString('doctorId'))
          .limit(72)
          .get();
      appointmentsData.value = snapshot.docs.map((doc) {
        return AppointmentData.formJson(doc.id, doc.data());
      }).toList();
      print('\n fetchAppointment ended ${appointmentsData.length} \n');
    } catch (e) {
      print(e);
    }
  }

  void addTasks() {
    print('\n addTasks \n');
    if (appointmentsData.isEmpty) {
      print('there is no Appointments to add ');
      fetched.value = true;
    } else {
      try {
        DateTime? date;
        int day;
        for (int i = 0; i < appointmentsData.length; i++) {
          date = appointmentsData[i].date.toDate();
          print(date!.day);
          print(current.day);
          if (date.day < current.day) {
            day = 3;
          } else if (date.day >= current.day) {
            print(date.day);
            print(current.day);
            day = date.day - current.day;
            if (day > 2) {
              day = 4;
            }
          } else {
            day = 4;
          }
          appointments.add(
            TimePlannerTask(
              color: Colors.red,
              dateTime: TimePlannerDateTime(
                  day: day, hour: date.hour, minutes: date.minute),
              minutesDuration: 30,
              child: const Text(
                'Booked',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          );
          print(
              '\n addTasks ended appointment length :${appointments.length} \n');
        }
        fetched.value = true;
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void onInit() async {
    nextThreeDay();
    startEndForThreeTime();
    await fetchAppointment();
    dayWorkTime();
    addTasks();
    //print(appointmentsData);
    super.onInit();
  }
}
