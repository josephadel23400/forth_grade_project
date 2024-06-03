import 'package:clinic_project/model/hospital_model.dart';
import 'package:clinic_project/view/screens/super_admin/super_admin_hospital_list/super_admin_hospital_details/super_admin_hospital_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constant.dart';
import '../../../../widget/customElevatedButton.dart';
import '../../../../widget/customHeaderText.dart';
import '../../../../widget/customScaffold.dart';
import '../../../../widget/dataTextDiscrition.dart';
import '../../../../widget/personInformation.dart';
import '../../../../widget/text_form_feild.dart';

class SuperAdminHospitalDetailsPage extends StatelessWidget {
  const SuperAdminHospitalDetailsPage({super.key, required this.hospital});
  final HospitalModel hospital;
  @override
  Widget build(BuildContext context) {

    SuperAdminHospitalController controller =
        Get.put(SuperAdminHospitalController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    String? shouldDelete;
    return CustomScaffold(
      showBack: true,
      widgetList: [
        SizedBox(
          height: screenHeight * .03,
        ),
        const CustomHeaderText(text: 'Hospital Details'),
        PersonInformationCard(
          gender: true,
          hasPhoto: hospital.photo != null,
          image: hospital.photo,
          header1: 'Name',
          header2: 'Manager Name',
          icon1: Icons.shield_moon,
          icon2: Icons.manage_accounts,
          text1: hospital.name,
          text2: hospital.managerName,
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * .025),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * .01,
              ),
              DataTextDescription(
                icon: Icons.phone,
                text: hospital.phone.toString(),
                header: 'phone',
              ),
              DataTextDescription(
                icon: Icons.numbers,
                text: hospital.ZEPCode.toString(),
                header: 'Age',
              ),
              DataTextDescription(
                icon: Icons.emergency,
                text: hospital.emergencyNumber.toString(),
                header: 'Shift start in',
              ),
              DataTextDescription(
                icon: Icons.timer,
                text: hospital.type,
                header: 'Shift end in',
              ),
              DataTextDescription(
                icon: Icons.streetview,
                text: hospital.address ?? 'there is no note add',
                header: 'Certificate',
              ),
              GestureDetector(
                onTap: () async {
                  if (hospital.location == null) {
                    Get.defaultDialog(
                        content: const Text('there is no location added'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('close'))
                        ]);
                  } else {
                    final Uri uri = Uri.parse(hospital.location);
                    await launchUrl(uri);
                  }
                },
                child: DataTextDescription(
                  icon: Icons.location_on,
                  text: 'Press to open hospital location',
                  header: 'Hospital Location',
                ),
              ),
              SizedBox(
                height: screenHeight * .03,
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * .07),
                child: CustomElevatedButton(
                  hasText: true,
                  text: 'Delete Account',
                  minimanH: screenHeight * .07,
                  minimanW: screenWidth * .7,
                  color: Colors.red,
                  textColor: Colors.black,
                  onTap: () {
                    Get.defaultDialog(
                        title: 'Delete Account',
                        content: const Text(
                            'if are you sure  to delete this account write \' delete \' and press \' submit \''),
                        actions: [
                          Column(
                            children: [
                              CustomTextFormField(
                                  hint: 'write delete',
                                  label: 'delete',
                                  icon: const Icon(Icons.remove_circle),
                                  onChang: (value) {
                                    shouldDelete = value;
                                  },
                                  isSecure: false),
                              SizedBox(
                                height: screenHeight * .05,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomElevatedButton(
                                    minimanH: screenHeight * .08,
                                    minimanW: screenWidth * .1,
                                    hasText: true,
                                    text: 'submit',
                                    color: Colors.blueGrey,
                                    textColor: Colors.white,
                                    onTap: () async {
                                      if (shouldDelete == 'delete') {
                                        await controller.deleteHospital();
                                        Get.offAllNamed('/super_admin_home');
                                      } else {
                                        Get.back();
                                      }
                                    },
                                  ),
                                  CustomElevatedButton(
                                      minimanW: screenWidth * .1,
                                      minimanH: screenHeight * .08,
                                      hasText: true,
                                      text: '  close  ',
                                      color: Colors.blueGrey,
                                      textColor: Colors.white,
                                      onTap: () {
                                        Get.offAllNamed('/super_admin_home');
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ]);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
      imageName: kHospital,
    );
  }
}
