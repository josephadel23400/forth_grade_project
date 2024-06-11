import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/constant.dart';
import '../core/widget/customScaffold.dart';
import '../core/widget/custom_header_text.dart';
import '../core/widget/custom_session_data_container.dart';
import '../custom_session_data_with_button.dart';
import 'graduate_student/profile/session_details/student_graduate_session_details_page.dart';

class Sessions extends StatelessWidget {
  const Sessions({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .025,
      ),
      const CustomHeaderText(text: 'Available Events'),
      SizedBox(
        height: screenHeight * .02,
      ),
      CustomSessionDataContainer(
        inFuture: true,
        type: 'information session',
        onTap: () {
          Get.to(StudentGraduateSessionDetailsPageWith(
            sessionType: 'Workshop',
            speakerName: 'Dr.Mohamed',
            title: 'Security programming  ',
            startIn: '2/2/2024',
            endIn: '3/2/2024',
            startInHour: '10:30 am',
            endInHour: '11:30 am',
            sessionDetails:
                'Dr.Mohamed will give us a introduction into security programming world , and how to be a good in bug hunter  security engineers',
            place: 'Luxor FCI / Al- ',
            maximumAttendance: 30,
            companyName: 'LUXOR FCI',
          ));
        },
        sessionSpeaker: 'Dr.Ahmed ',
        sessionTitle: 'Super AI  ',
        startIn: '10/7/2024',
        endIn: '10/7/2024',
        startInHour: '10:30am',
        endInHour: '2:00pm',
      ),
      CustomSessionDataContainer(
        inFuture: false,
        type: 'information session',
        onTap: () {
          Get.to(StudentGraduateSessionDetailsPageWith(
            sessionType: 'Workshop',
            speakerName: 'Dr.Mohamed Abdulhameed',
            title: 'Security programming  ',
            startIn: '2/2/2024',
            endIn: '3/2/2024',
            startInHour: '10:30 am',
            endInHour: '11:30 am',
            sessionDetails:
                'Dr.Mohamed will give us a introduction into security programming world , and how to be a good in bug hunter  security engineers',
            place: 'Luxor FCI / Al-Awamiya ',
            maximumAttendance: 30,
            companyName: 'LUXOR FCI',
          ));
        },
        sessionSpeaker: 'Dr.Ahmed abd el hamed el   el den ',
        sessionTitle: 'Intro to AI   ',
        startIn: '2/6/2024',
        endIn: '5/6/2024',
        startInHour: '10:30am',
        endInHour: '2:00pm',
      ),
      CustomSessionDataContainer(
        inFuture: false,
        type: 'information session',
        onTap: () {
          Get.to(StudentGraduateSessionDetailsPageWith(
            sessionType: 'Workshop',
            speakerName: 'Dr.Mohamed ',
            title: 'Security programming  ',
            startIn: '2/2/2024',
            endIn: '3/2/2024',
            startInHour: '10:30 am',
            endInHour: '11:30 am',
            sessionDetails:
                'Dr.Mohamed will give us a introduction into security programming world , and how to be a good in bug hunter  security engineers',
            place: 'Luxor FCI / Al- ',
            maximumAttendance: 30,
            companyName: 'LUXOR FCI',
          ));
        },
        sessionSpeaker: 'Dr.Ahmed abd el hamed ',
        sessionTitle: 'Android programming  ',
        startIn: '10/6/2024',
        endIn: '10/6/2024',
        startInHour: '10:30am',
        endInHour: '2:00pm',
      ),
    ], imageName: kSpeakerInSession);
  }
}
