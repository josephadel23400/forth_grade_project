import 'package:flutter/cupertino.dart';
import 'package:fourth_grade_project/view/graduate_student/profile/session_details/student_graduate_session_details_page.dart';
import 'package:get/get.dart';

import '../core/constant.dart';
import '../core/widget/customScaffold.dart';
import '../core/widget/custom_header_text.dart';
import '../core/widget/custom_session_data_container.dart';
import 'job_details.dart';

class Jobs extends StatelessWidget {
  const Jobs({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .025,
      ),
      const CustomHeaderText(text: 'Available Jobs'),
      SizedBox(
        height: screenHeight * .02,
      ),
      CustomSessionDataContainer(
        inFuture: true,
        type: 'internship',
        onTap: () {
          Get.to(StudentGraduateSessionJobDetails(
            title:'C# developer',
            endIn: '3/2/2024',
            endInHour: '11:30 am',
            sessionDetails: 'wanna good beginner in C#',
            companyName: 'LUXOR FCI', requirement: 'A year\'s experience in C# ',
          ));
        },
        sessionSpeaker: 'LUXOR FCI ',
        sessionTitle: ' C# ',
        startIn: '',
        endIn: '3/2/2024',
        startInHour: '',
        endInHour: '11:30 am',
      ),
    ], imageName: kSpeakerInSession);
  }
}
