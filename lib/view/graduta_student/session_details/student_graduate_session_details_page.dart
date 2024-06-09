import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';

import '../../../core/widget/custom_data_view_box.dart';

class StudentGraduateSessionDetailsPage extends StatelessWidget {
  StudentGraduateSessionDetailsPage({
    super.key,
    required this.sessionType,
    required this.speakerName,
    required this.title,
    required this.startIn,
    required this.endIn,
    required this.startInHour,
    required this.endInHour,
    required this.sessionDetails,
    required this.place,
    required this.companyName,
    required this.maximumAttendance,
  });
  String sessionType;
  String speakerName;
  String title;
  String companyName;
  String startIn;
  String endIn;
  String startInHour;
  String endInHour;
  String sessionDetails;
  String place;
  int maximumAttendance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      CustomHeaderText(text: '$sessionType Details'),
      CustomDataViewBox(
        content: title,
        label: '$sessionType title',
        onTap: () {},
        canModify: true,
      ),
      CustomDataViewBox(
        content: '$startIn  $startInHour',
        label: 'Start In',
        onTap: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: '$endIn  $endInHour',
        label: 'End In',
        onTap: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: speakerName,
        label: 'Speaker Name',
        onTap: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: place,
        label: 'Place',
        onTap: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: sessionDetails,
        label: '$sessionType Note',
        onTap: () {},
        canModify: true,
      ),
      CustomDataViewBox(
        content: companyName,
        label: 'Company name',
        onTap: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: maximumAttendance.toString(),
        label: 'Maximum Attendance',
        onTap: () {},
        canModify: false,
      ),
    ], imageName: kSpeakerInSession);
  }
}
