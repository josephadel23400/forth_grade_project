import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';

class StudentGraduateSessionDetailsPage extends StatelessWidget {
  const StudentGraduateSessionDetailsPage({super.key});
String sessionType;
String speakerName;
String title;
String startIn;
String endIn;
String startInHour;
String endInHour;
String sessionDetails;
String place;
String maximumAttendance;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(widgetList: [CustomHeaderText(text: '$sessionType Details')], imageName: kSpeakerInSession);
  }
}
