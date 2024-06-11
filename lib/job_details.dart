import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/custom_elevated_button.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:fourth_grade_project/view/graduate_student/profile/session_details/student_graduate_session_details_controller.dart';
import 'package:get/get.dart';

import '../../../../core/widget/custom_data_view_box.dart';

class StudentGraduateSessionJobDetails extends StatelessWidget {
  StudentGraduateSessionJobDetails({
    super.key,
    required this.title,
    required this.endIn,
    required this.endInHour,
    required this.sessionDetails,
    required this.requirement,
    required this.companyName,
  });
  String title;
  String requirement;
  String companyName;
  String endIn;
  String endInHour;
  String sessionDetails;
  @override
  Widget build(BuildContext context) {
    StudentGraduateSessionDetailsController controller = Get.put(StudentGraduateSessionDetailsController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .02,
      ),
      const CustomHeaderText(text: 'Jobs Details'),
      SizedBox(
        height: screenHeight * .01,
      ),
      CustomDataViewBox(
        content: title,
        label: 'Job title',
        function: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: requirement,
        label: 'Job requirement',
        function: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: companyName,
        label: 'Company name',
        function: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: sessionDetails,
        label: 'Job description ',
        function: () {},
        canModify: false,
      ),
      SizedBox(height: screenHeight * .02,),
      //todo: add these 2 relation here don't forget to remove the 'True'
      if(//todo: user is student and graduate && the session does not start yet
      true)Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * .1, 0,
            screenWidth * .1, screenHeight * .03),
        child: CustomElevatedButton(
          color: kMainColor,
          textColor: Colors.black,
          onTap: () {
            //todo: here add the function that delete graduate or student from the session
          },
          hasText: true,
          fontWeight: FontWeight.w400,
          text: 'Apply for job',
          minimanH: screenHeight * .06,
          minimanW: screenWidth * .5,
        ),
      )
    ], imageName: kSpeakerInSession);
  }
}
