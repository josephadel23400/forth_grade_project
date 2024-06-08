import 'package:flutter/cupertino.dart';
import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:fourth_grade_project/core/widget/custom_session_data_container.dart';

class StudentGraduateSessionRecordPage extends StatelessWidget {
  const StudentGraduateSessionRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      const CustomHeaderText(text: 'Events Record'),
      SizedBox(
        height: screenHeight * .02,
      ),
      CustomSessionDataContainer(
        inFuture: false,
        type: 'session',
        sessionSpeaker: 'Dr.Ahmed',
        sessionTitle: 'Super AI',
        startIn: '10/7/2024',
        endIn: '10/7/2024',
        startInHour: '10:30am',
        endInHour: '2:00pm',
      ),
    ], imageName: kSpeakerInSession);
  }
}
