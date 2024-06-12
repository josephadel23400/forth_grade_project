import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:get/get.dart';

import '../../../../core/widget/career_advisor_custom_list_tail.dart';
import '../../../../core/widget/custom_header_text.dart';
import '../../career_advisor_my_session/career_advisor_mysession_page.dart';
import '../../career_advisor_my_session/registerd_members/registered_members_page.dart';
import '../../career_advisor_my_session/session_attendace/session_attendance_page.dart';
import 'career_advisor_sessions_controller.dart';

class CareerAdvisorSessionsPage extends StatelessWidget {
  const CareerAdvisorSessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    CareerAdvisorSessionsController controller =
        Get.put(CareerAdvisorSessionsController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
        inNavigatorButton: false,
        widgetList: [
          SizedBox(
            height: screenHeight * .025,
          ),
          const CustomHeaderText(text: 'My Sessions'),
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
                return const Center(
                  child: Text('There are no sessions that you are created in.'),
                );
              } else {
                return SizedBox(
                  height: screenHeight * .66,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.sessions.length,
                    itemBuilder: (context, index) {
                      var session = controller.sessions[index];
                      return CareerAdvisorCustomListTail(
                          color: kMainColor,
                          isPass: session.isPassed,
                          title: session.sessionType,
                          onTap: () {
                            Get.to(
                              CareerAdvisorMySessionPage(
                                sessionType: session.sessionType,
                                applied: session.applied,
                                startInHour: session.startInHour,
                                sessionDetails: session.sessionDetails,
                                place: session.place,
                                maximumAttendance: session.maximumAttendance,
                                speakerName: session.speakerName,
                                endInHour: session.endInHour,
                                companyName: session.companyName,
                                title: session.sessionType,
                                endIn: session.endIn,
                                startIn: session.startIn,
                                isPassed: session.isPassed,
                                attendanceOnTap: () {
                                  Get.to(const SessionAttendancePage());
                                },
                                registeredMemberOnTap: () {
                                  Get.to(const RegisteredMembersPage());
                                },
                              ),
                            );
                          },
                          startDate: session.startIn,
                          endDate: session.endIn,
                          applied: session.applied,
                          maximumAttendance: session.maximumAttendance);
                    },
                  ),
                );
              }
            },
          ),
        ],
        imageName: kSpeakerInSession);
  }
}
