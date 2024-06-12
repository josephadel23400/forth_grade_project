import 'package:flutter/material.dart';
import 'package:fourth_grade_project/view/graduate_student/jobs/student_graduate_jobs_controller.dart';
import 'package:get/get.dart';

import '../../../core/constant.dart';
import '../../../core/widget/customScaffold.dart';
import '../../../core/widget/custom_header_text.dart';
import '../../../core/widget/custom_job_data_container.dart';
import '../job_details/student_graduate_job_details_page.dart';

class StudentGraduateJobsPage extends StatelessWidget {
  const StudentGraduateJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    StudentGraduateJobsController controller =
        Get.put(StudentGraduateJobsController());
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .025,
      ),
      const CustomHeaderText(text: 'Available Jobs'),
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
          } else if (controller.jobs.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * .1),
                child: Text(
                  'There are no jobs added yet.',
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
                itemCount: controller.jobs.length,
                itemBuilder: (context, index) {
                  var job = controller.jobs[index];
                  return CustomJobDataContainer(
                    inFuture: job.inFuture,
                    jobType: job.jobType,
                    onTap: () {
                      Get.to(StudentGraduateJobDetailsPage(
                        //todo: didAppliedForJob  = is the user apply for this job or not
                        jobType: job.jobType,
                        onTap: () {
                          //todo: if the job is in bast this on tap let it empty
                          //todo: if the job didn't start yet and didn't and i applied for it add here the delete me from job
                          //todo: if the student or graduate want to apply into job add the function here
                          //todo :and make update to or reload to this page to refresh the jobmake the fetch again and assign the value to the RxList to reloade the bage
                        },
                        didAppliedForJob: job.didAppliedForJob,
                        //todo: inFuture  = is the this job still available
                        inFuture: job.inFuture,
                        jobTitle: job.jobTitle,
                        endIn: job.endIn,
                        endInHour: job.endInHour,
                        jobDescription: job.jobDescription,
                        companyName: job.companyName,
                        jobRequirement: job.jobRequirement,
                      ));
                    },
                    companyName: job.companyName,
                    jobTitle: job.jobTitle,
                    endIn: job.endIn,
                    endInHour: job.endInHour,
                  );
                },
              ),
            );
          }
        },
      ),
    ], imageName: kLookingForJob);
  }
}
