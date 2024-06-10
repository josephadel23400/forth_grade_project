import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:fourth_grade_project/core/widget/custom_list_tail.dart';

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
        color: kMainColor,
        title: 'Kosom El C.C',
        endDate: '2/7/2024',
        name: 'Dr.Ahmed',
        isPass: false,
        startDate: '1/7/2024',
      ),
      SizedBox(
        height: screenHeight * .02,
      ),
      CustomListTail(
        color: kMainColor,
        title: 'Nigga Day',
        endDate: '2/6/2024',
        name: 'Dr.Ahmed',
        isPass: true,
        startDate: '1/6/2024',
      ),
    ], imageName: kBookGlasses);
  }
}
