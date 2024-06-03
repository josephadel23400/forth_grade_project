import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../constant.dart';
import '../../../widget/customHeaderText.dart';
import '../../../widget/customScaffold.dart';
import '../../../widget/customTextView.dart';
import 'hospital_file_controller.dart';

class HospitalProfile extends StatelessWidget {
  const HospitalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    HospitalProfileController controller = Get.put(HospitalProfileController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Obx(
      () {
        if (controller.hospitalData.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return CustomScaffold(showBack: true,widgetList: [
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
                        image: controller.hospitalData[0].photo == null
                            ? NetworkImage(controller.imageUrl!.value)
                            : NetworkImage(controller.hospitalData[0].photo),
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
                    text: controller.hospitalData.isEmpty
                        ? 'there is no data'
                        : controller.hospitalData[0].name!,
                    icon: Icons.person,
                    header: 'Name',
                  ),
                ),
                //type
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    showIcon: true,
                    function: () {
                      controller.updateType();
                    },
                    height: screenHeight * .08,
                    text: controller.hospitalData.isEmpty
                        ? 'there is no data'
                        : controller.hospitalData[0].type!,
                    icon: Icons.attach_money,
                    header: 'Type',
                  ),
                ),
                //Address
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    showIcon: true,
                    function: () {
                      controller.updateAddress();
                    },
                    height: screenHeight * .08,
                    text: controller.hospitalData.isEmpty
                        ? 'there is no data'
                        : controller.hospitalData[0].address!,
                    icon: Icons.streetview,
                    header: 'Address',
                  ),
                ),
                //location
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    showIcon: true,
                    function: () {
                      controller.updateLocation();
                    },
                    height: screenHeight * .08,
                    text: controller.hospitalData.isEmpty
                        ? 'there is no data'
                        : controller.hospitalData[0].location!,
                    icon: Icons.location_on,
                    header: 'Location',
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
                    text: controller.hospitalData.isEmpty
                        ? 'there is no data'
                        : controller.hospitalData[0].phone!.toString(),
                    icon: Icons.phone,
                    header: 'Phone',
                  ),
                ),
                //managerName
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    showIcon: true,
                    function: () {
                      controller.updateMName();
                    },
                    height: screenHeight * .08,
                    text: controller.hospitalData.isEmpty
                        ? 'there is no data'
                        : controller.hospitalData[0].managerName!,
                    icon: Icons.manage_accounts,
                    header: 'Manager Name',
                  ),
                ),
                //ZIP cone
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    showIcon: true,
                    function: () {
                      controller.updateZep();
                    },
                    text: controller.hospitalData.isNotEmpty
                        ? controller.hospitalData[0].ZEPCode.toString() ?? ''
                        : 'specialty not available',
                    height: screenHeight * .08,
                    icon: Icons.code,
                    header: 'ZIP code',
                  ),
                ),
                //EmergencyNumber
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    showIcon: true,
                    function: () {
                      controller.updateEmergencyNumber();
                    },
                    text: controller.hospitalData.isNotEmpty
                        ? controller.hospitalData[0].emergencyNumber
                                .toString() ??
                            ''
                        : 'specialty not available',
                    height: screenHeight * .08,
                    icon: Icons.emergency,
                    header: 'EmergencyNumber',
                  ),
                ),
                //sup_admin_email
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomTextView(
                    //showIcon: true,
                    function: () {
                      //controller.updateEmergencyNumber();
                    },
                    text: controller.hospitalData.isNotEmpty
                        ? controller.hospitalData[0].subAdmin ?? ''
                        : 'specialty not available',
                    height: screenHeight * .08,
                    icon: Icons.email,
                    header: 'Sup Admin Email',
                  ),
                ),
              ],
            ),

            //CustomTextFormFieldWithSuffix(hint: hint, label: label, icon: icon, suffixIcon: suffixIcon, onChang: onChang, isSecure: isSecure)
          ], imageName: kHospital);
        }
      },
    );
  }
}
