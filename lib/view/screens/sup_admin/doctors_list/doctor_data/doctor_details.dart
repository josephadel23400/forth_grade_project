import 'package:clinic_project/model/doctor_Model.dart';
import 'package:clinic_project/view/widget/customElevatedButton.dart';
import 'package:clinic_project/view/widget/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constant.dart';
import '../../../../widget/customHeaderText.dart';
import '../../../../widget/customScaffold.dart';
import '../../../../widget/dataTextDiscrition.dart';
import '../../../../widget/personInformation.dart';
import '../../../patient/doctorsList.dart';
import 'doctor_details_controller.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key, required this.dData});
  final DoctorsModel dData;
  @override
  Widget build(BuildContext context) {
    DoctorDetailsController controller = Get.put(DoctorDetailsController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    String? shouldDelete;
    return CustomScaffold(
      back: false,
      onTap: () {
        Get.back();
      },
      showBack: true,
      widgetList: [
        SizedBox(
          height: screenHeight * .03,
        ),
        const CustomHeaderText(text: 'Appointment Details'),
        PersonInformationCard(
          gender: dData.gender,
          hasPhoto: dData.photo != null,
          image: dData.photo,
          header1: 'Name',
          header2: 'Speciality',
          icon1: Icons.person_outline_outlined,
          icon2: Icons.medical_information_outlined,
          text1: dData.name,
          text2: dData.specialty,
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
                text: dData.phone.toString(),
                header: 'phone',
              ),
              DataTextDescription(
                icon: Icons.timer_outlined,
                text: dData.startIn.toString(),
                header: 'Shift start in',
              ),
              DataTextDescription(
                icon: Icons.timer,
                text: dData.endIn.toString(),
                header: 'Shift end in',
              ),
              DataTextDescription(
                icon: Icons.checklist_rtl,
                text: dData.certificate ?? 'there is no note add',
                header: 'Certificate',
              ),
              DataTextDescription(
                icon: Icons.numbers,
                text: dData.age.toString(),
                header: 'Age',
              ),
              DataTextDescription(
                icon: Icons.credit_card_rounded,
                text: dData.nationalId.toString(),
                header: 'National Id',
              ),
            ],
          ),
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
                      'if you are sure  to delete this account write \' delete \' and press \' submit \''),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  await controller.deleteDoctor();
                                  Get.toNamed('/sup_admin_doctors_specialty');
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
                                  Get.toNamed('/sup_admin_doctors_specialty');
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
      imageName: kDoctorDetails,
    );
  }
}
