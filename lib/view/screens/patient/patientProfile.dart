import 'package:clinic_project/constant.dart';
import 'package:clinic_project/services/settingService.dart';
import 'package:flutter/material.dart'; // Import the necessary Flutter packages

import 'package:clinic_project/view/widget/customHeaderText.dart';

import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:clinic_project/view/widget/customTextView.dart';

import 'package:get/get.dart';

import '../../../controller/PatientProfileController.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    PatientProfileController controller = Get.put(PatientProfileController());
    SettingServices share = Get.find();
    //String textValue = 'the data wfgdgdfgdgdfgdfgdgdfgdgdgdgdgdgdgill be here ';
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Obx(
      () {
        if (controller.patientDate.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return CustomScaffold(widgetList: [
            SizedBox(
              height: screenHeight * .02,
            ),
            const CustomHeaderText(
              text: 'Profile',
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black, // Specify the color of the border
                  width: 1, // Specify the width of the border
                ),
              ),
              child: controller.imageUrl == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CircleAvatar(
                      radius: screenWidth * .175, // Half of the desired width
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                          child: Image(
                        image: controller.patientDate[0].photo == null
                            ? NetworkImage(controller.imageUrl!.value)
                            : NetworkImage(controller.patientDate[0].photo),
                        fit: BoxFit
                            .cover, // Ensure the image covers the entire area
                        width: screenWidth * .35,
                        height: screenHeight * .24,
                      )
                          // : Image(
                          //     image:NetworkImage(
                          //         controller.patientDate[0].photo),
                          //     fit: BoxFit.cover,
                          //     width: screenWidth * .35,
                          //     height: screenHeight * .24,
                          //   ),
                          ),
                    ),
            ),
            SizedBox(
              height: screenHeight * .015,
            ),
            Center(
                child: Text(
              'Add Photo',
              style: TextStyle(
                fontSize: screenWidth * .04,
                color: kMainFontBold,
              ),
            )),
            Padding(
              padding: EdgeInsets.fromLTRB(
                screenWidth * .1,
                screenHeight * .01,
                screenWidth * .1,
                0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: screenHeight * .05,
                    width: screenWidth * .37,
                    child: ElevatedButton(
                      onPressed: () async {
                        controller.image = await controller.pickImage();
                        controller.uploadImageToFirebaseStorage();
                        controller.update();
                      },
                      child: const Text('OpenGallery'),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .01,
                  ),
                  SizedBox(
                    height: screenHeight * .05,
                    width: screenWidth * .37,
                    child: ElevatedButton(
                      onPressed: () async {
                        controller.image = await controller.pickPhoto();
                        controller.uploadImageToFirebaseStorage();
                        controller.update();
                      },
                      child: const Text('OpenCamera'),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * .015,
            ),
            Column(
              children: [
                //name
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    showIcon: true,
                    function: () {
                      controller.updateName();
                    },
                    height: screenHeight * .08,
                    text: controller.patientDate.isEmpty
                        ? 'there is no data'
                        : controller.patientDate[0].name!,
                    icon: Icons.person,
                    header: 'Name',
                  ),
                ),
                //age
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    showIcon: true,
                    function: () {
                      controller.updateAge();
                    },
                    height: screenHeight * .08,
                    text: controller.patientDate.isEmpty
                        ? 'there is no data'
                        : controller.patientDate[0].age!.toString(),
                    icon: Icons.date_range,
                    header: 'Age',
                  ),
                ),
                //email
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    function: () {},
                    height: screenHeight * .08,
                    text: controller.patientDate.isEmpty
                        ? 'there is no data'
                        : controller.patientDate[0].email!,
                    icon: Icons.email,
                    header: 'Email',
                  ),
                ),
                //phone
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    showIcon: true,
                    function: () {
                      controller.updatePhone();
                    },
                    height: screenHeight * .08,
                    text: controller.patientDate.isEmpty
                        ? 'there is no data'
                        : controller.patientDate[0].phone!.toString(),
                    icon: Icons.phone,
                    header: 'Phone',
                  ),
                ),
                //gender
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    function: () {},
                    height: screenHeight * .08,
                    text: controller.patientDate.isEmpty
                        ? 'there is no data'
                        : controller.patientDate[0].gender! == true
                            ? 'male'
                            : 'female',
                    icon: controller.patientDate[0].gender! == true
                        ? Icons.male
                        : Icons.female,
                    header: 'Gender',
                  ),
                ),
                //Medical note
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    showIcon: true,
                    function: () {
                      controller.updateNote();
                    },
                    text: controller.patientDate.isNotEmpty
                        ? controller.patientDate[0].medicalNote ??
                            'No note added'
                        : 'Medical note not available',
                    height: screenHeight * .6,
                    icon: Icons.note_alt,
                    header: 'Medical note',
                  ),
                ),
              ],
            ),

            //CustomTextFormFieldWithSuffix(hint: hint, label: label, icon: icon, suffixIcon: suffixIcon, onChang: onChang, isSecure: isSecure)
          ], imageName: kProfile);
        }
      },
    );
  }
}
