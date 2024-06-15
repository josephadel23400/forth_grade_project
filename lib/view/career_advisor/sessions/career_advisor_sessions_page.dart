import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/constant.dart';
import '../../../core/widget/customScaffold.dart';
import '../../../core/widget/custom_header_text.dart';
import '../../../core/widget/custom_session_data_container.dart';
import '../../graduate_student/session_details/student_graduate_session_details_page.dart';
import 'career_advisor_sessions_controller.dart';

class CareerAdvisorSessionsPage extends StatelessWidget {
  const CareerAdvisorSessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    CareerAdvisorSessionsController controller = Get.put(CareerAdvisorSessionsController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .025,
      ),
      const CustomHeaderText(text: 'Available Events'),
      Padding(
        padding: EdgeInsets.all(screenWidth * .02),
        child: DropdownButtonFormField<int>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          value: 1,
          items: controller.dropdownMenuItems,
          onChanged: (value) {
            // todo: Handle the change here if needed
            // TODO : DON'T FORGET TO UPDATE THE LIST VALUE WITH THE SEARCH RESULT TO MAKE Obx UPDATE
            controller.update();
          },
        ),
      ),
      Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * .3,
                  ),
                  CircularProgressIndicator(
                    color: kMainButton, // Use the main color
                  ),
                ],
              ),
            );
          } else if (controller.sessions.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * .1),
                child: Text(
                  'There are no sessions added yet.',
                  style: TextStyle(fontSize: screenHeight * .025),
                ),
              ),
            );
          } else {
            return SizedBox(
              height: screenHeight * .51,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.sessions.length,
                itemBuilder: (context, index) {
                  var session = controller.sessions[index];
                  return CustomSessionDataContainer(
                    inFuture: !session.isPassed,
                    type: session.sessionType,
                    onTap: () {
                      Get.to(
                        StudentGraduateSessionDetailsPage(
                          onTap: () {},
                          isPassed: session.isPassed,
                          isCareerAdvisor: true,
                          enrolledOrNot: session.enrolledOrNot,
                          sessionType: session.sessionType,
                          speakerName: session.speakerName,
                          title: session.title,
                          startIn: session.startIn,
                          endIn: session.endIn,
                          startInHour: session.startInHour,
                          endInHour: session.endInHour,
                          sessionDetails: session.sessionDetails,
                          place: session.place,
                          applied: session.applied,
                          maximumAttendance: session.maximumAttendance,
                          companyName: session.companyName,
                        ),
                      );
                    },
                    sessionSpeaker: session.speakerName,
                    sessionTitle: session.title,
                    startIn: session.startIn,
                    endIn: session.endIn,
                    startInHour: session.startInHour,
                    endInHour: session.endInHour,
                  );
                },
              ),
            );
          }
        },
      ),
    ], imageName: kSpeakerInSession);
  }
}
