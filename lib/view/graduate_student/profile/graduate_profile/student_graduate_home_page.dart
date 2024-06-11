import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:fourth_grade_project/core/widget/custom_list_tail.dart';
import 'package:get/get.dart';
import '../session_details/student_graduate_session_details_page.dart';

class StudentGraduateHomePage extends StatelessWidget {
  const StudentGraduateHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .02,
      ),
      const CustomHeaderText(text: 'Home'),
      SizedBox(
        height: screenHeight * .02,
      ),
      CustomListTail(
        onTap: () {
          Get.to(
            StudentGraduateSessionDetailsPage(
              sessionType: 'Session',
              title: 'hi in programming',
              companyName: 'Luxor FCI',
              endInHour: '4:00 pm',
              endIn: '2/7/2024',
              speakerName: 'Dr.Ahmed',
              maximumAttendance: 30,
              place: 'Luxor FCI',
              sessionDetails: 'hi ',
              startIn: '1/7/2024',
              startInHour: '10:30 am',
            ),
          );
        },
        color: kMainColor,
        title: 'hi in programming ',
        endDate: '2/7/2024',
        name: 'Dr.Ahmed',
        isPass: false,
        startDate: '1/7/2024',
      ),
      SizedBox(
        height: screenHeight * .02,
      ),
      CustomListTail(
        onTap: () {
          Get.to(
            StudentGraduateSessionDetailsPage(
              sessionType: 'info session',
              title: 'hi in programming',
              companyName: 'Luxor FCI',
              endInHour: '4:00 pm',
              endIn: '2/6/2024',
              speakerName: 'Dr.mohamed',
              maximumAttendance: 15,
              place: 'Luxor FCI',
              sessionDetails: 'hi ',
              startIn: '1/6/2024',
              startInHour: '10:30 am',
            ),
          );
        },
        color: kMainColor,
        title: 'welcome in programming',
        endDate: '2/6/2024',
        name: 'Dr.mohamed',
        isPass: true,
        startDate: '1/6/2024',
      ),
    ], imageName: kBookGlasses);
  }
}
