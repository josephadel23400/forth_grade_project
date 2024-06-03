import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant.dart';
import '../../../../services/settingService.dart';
import '../../../widget/customHeaderText.dart';
import '../../../widget/customScaffold.dart';
import '../../../widget/customTextView.dart';
import 'doctor_profile_controller.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorProfileController controller = Get.put(DoctorProfileController(),permanent: false);
    SettingServices share = Get.find();
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Obx(
          () {
        if (controller.doctorData.isEmpty) {
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
            //image
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
                      image: controller.doctorData[0].photo == null
                          ? NetworkImage(controller.imageUrl!.value)
                          : NetworkImage(controller.doctorData[0].photo),
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
            //add image
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
            //data
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
                    text: controller.doctorData.isEmpty
                        ? 'there is no data'
                        : controller.doctorData[0].name!,
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
                    text: controller.doctorData.isEmpty
                        ? 'there is no data'
                        : controller.doctorData[0].age!.toString(),
                    icon: Icons.date_range,
                    header: 'Age',
                  ),
                ),
                //certificate
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    showIcon: true,
                    function: () {
                      controller.updateCertificate();
                    },
                    height: screenHeight * .08,
                    text: controller.doctorData.isEmpty
                        ? 'there is no data'
                        : controller.doctorData[0].certificate!,
                    icon: Icons.badge,
                    header: 'Certificate',
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
                    text: controller.doctorData.isEmpty
                        ? 'there is no data'
                        : controller.doctorData[0].phone!.toString(),
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
                    text: controller.doctorData.isEmpty
                        ? 'there is no data'
                        : controller.doctorData[0].gender! == true
                        ? 'male'
                        : 'female',
                    icon: controller.doctorData[0].gender! == true
                        ? Icons.male
                        : Icons.female,
                    header: 'Gender',
                  ),
                ),
                //specialty
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    //showIcon: true,
                    function: () {
                      //controller.updateNote();
                    },
                    text: controller.doctorData.isNotEmpty
                        ? controller.doctorData[0].specialty ??
                        ''
                        : 'specialty not available',
                    height: screenHeight * .08,
                    icon: Icons.note_alt,
                    header: 'Specialty',
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
