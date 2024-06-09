import 'package:flutter/cupertino.dart';
import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:fourth_grade_project/core/widget/custom_session_data_container.dart';
import 'package:get/get.dart';

import '../session_details/student_graduate_session_details_page.dart';

class StudentGraduateSessionRecordPage extends StatelessWidget {
  const StudentGraduateSessionRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .025,
      ),
      const CustomHeaderText(text: 'Events Record'),
      SizedBox(
        height: screenHeight * .02,
      ),
      CustomSessionDataContainer(
        inFuture: true,
        type: 'information session',
        onTap: () {
          Get.to(StudentGraduateSessionDetailsPage(
            sessionType: 'Workshop',
            speakerName: 'Dr.Mohamed Abdulhameed',
            title: 'Security programming ',
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
        sessionSpeaker: 'Dr.Ahmed abd el hamed el nigga sharf el den aybak',
        sessionTitle:
            'Super AI in calforina in nigga town satarday and nigganight ',
        startIn: '10/7/2024',
        endIn: '10/7/2024',
        startInHour: '10:30am',
        endInHour: '2:00pm',
      ),
    ], imageName: kSpeakerInSession);
  }
}
