import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:fourth_grade_project/core/widget/custom_data_view_box.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:fourth_grade_project/view/graduate_student/profile/student_profile/student_personal_information/student_personal_information_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StudentPersonalInformationPage extends StatelessWidget {
  const StudentPersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    StudentPersonalInformationController controller =
        Get.put(StudentPersonalInformationController());
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .02,
      ),
      const CustomHeaderText(text: 'My Personal Data'),
      SizedBox(
        height: screenHeight * .02,
      ),
      CustomDataViewBox(
        //todo:here put user name
        content: 'Joseph Adel Adip ',
        label: 'Full Name',
        function: () {
          //function that change username

        },

        canModify: true,
      ),
      CustomDataViewBox(
        //todo:here put email
        content: 'Josephadel@gmail.com',
        label: 'Email',
        function: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        //todo:here put phone
        content: '01010110071',
        label: 'Phone Number',
        function: () {
          //function that change phone number
        },
        canModify: true,
      ),
      CustomDataViewBox(
        //todo:here put ID
        content: '3030107148954568',
        label: 'ID',
        function: () {
          //function that change ID
        },
        canModify: true,
      ),
      CustomDataViewBox(
        content: 'male',
        label: 'Gender',
        function: () {},
        canModify: false,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * .02, 0, 0, 0),
        child: Text(
          'Birth Date',
          style: TextStyle(
            fontSize: screenWidth * .04,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      // date of birth
      Padding(
        //todo: this do pick the date of birth and put the value in *selectedDate*
        padding: EdgeInsets.all(screenWidth * .02),
        child: GestureDetector(
          onTap: () async {
            await controller.pickDate(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(
                color: Colors.black, // Border color
                width: .7, // Border width
              ),
              borderRadius: BorderRadius.circular(
                  10), // Optional: if you want sharp corners
            ),
            child: GetBuilder<StudentPersonalInformationController>(
              builder: (controller) => ListTile(
                //leading: const Icon(Icons.date_range_outlined),
                title: Text(
                  controller.date(),
                  style: TextStyle(
                    fontSize: screenWidth * .045,
                    color: Colors.grey,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: screenHeight * .02,
      ),
    ], imageName: kPersonalData);
  }
}
