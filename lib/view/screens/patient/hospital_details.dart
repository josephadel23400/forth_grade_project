import 'package:clinic_project/constant.dart';
import 'package:clinic_project/model/hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/customHeaderText.dart';
import '../../widget/customScaffold.dart';
import '../../widget/dataTextDiscrition.dart';
import '../../widget/personInformation.dart';

class HospitalDetailsPage extends StatelessWidget {
  HospitalDetailsPage({
    super.key,
    required this.hospital,
  });
  final HospitalModel hospital;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
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
                header: 'ZIP Code',
              ),
              DataTextDescription(
                icon: Icons.emergency,
                text: hospital.emergencyNumber.toString(),
                header: 'Emergency Number',
              ),
              DataTextDescription(
                icon: Icons.type_specimen_outlined,
                text: hospital.type,
                header: 'Type',
              ),
              DataTextDescription(
                icon: Icons.streetview,
                text: hospital.address ?? 'there is no note add',
                header: 'Address',
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
            ],
          ),
        ),
      ],
      imageName: kHospital,
    );
  }
}
