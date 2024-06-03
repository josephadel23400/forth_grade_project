import 'package:clinic_project/view/screens/super_admin/super_admin_add_hospital/super_admin_add_hospital_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant.dart';
import '../../../widget/customElevatedButton.dart';
import '../../../widget/customHeaderText.dart';
import '../../../widget/customScaffold.dart';
import '../../../widget/text_form_feild.dart';

class SuperAdminAddHospital extends StatelessWidget {
  const SuperAdminAddHospital({super.key});

  @override
  Widget build(BuildContext context) {
    SuperAdminAddHospitalController controller =
        Get.put(SuperAdminAddHospitalController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
      showBack: true,
      widgetList: [
        SizedBox(
          height: screenHeight * .03,
        ),
        const CustomHeaderText(text: 'Add New Doctor'),
        SizedBox(
          height: screenHeight * .02,
        ),
        //name
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: 'Enter Hospital Name',
              label: 'Hospital Name',
              icon: const Icon(CupertinoIcons.house_fill),
              onChang: (value) {
                controller.name = value;
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //email
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: 'Enter SupAdmin Email',
              label: 'Sup-Admin Email',
              icon: const Icon(Icons.email_outlined),
              onChang: (value) {
                controller.subAdmin = value;
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //password
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: 'Enter hospital Password',
              label: 'hospital Password',
              icon: const Icon(Icons.password_outlined),
              onChang: (value) {
                controller.password = value;
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //confirm password
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: 'Confirm Password',
              label: 'Confirm Password',
              icon: const Icon(Icons.password_outlined),
              onChang: (value) {
                controller.confirmPassword = value;
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //Manager Name
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: 'Enter Manager Name',
              label: 'Manager Name',
              icon: const Icon(Icons.manage_accounts),
              onChang: (value) {
                controller.managerName = value;
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //address
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: 'Enter Address',
              label: 'Address',
              icon: const Icon(Icons.streetview),
              onChang: (value) {
                controller.address = value;
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //Location
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: 'Enter Hospital Location',
              label: 'Location',
              icon: const Icon(Icons.location_on),
              onChang: (value) {
                controller.location = value;
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //type
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: 'Hospital Type',
              label: 'Enter Type',
              icon: const Icon(Icons.monetization_on),
              onChang: (value) {
                controller.type = value;
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //ZIP Code
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              numbersOnly: true,
              hint: 'Enter ZIP Code',
              label: 'ZIP Code',
              icon: const Icon(Icons.code),
              onChang: (value) {
                controller.ZEPCode = int.parse(value);
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //phone
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              numbersOnly: true,
              hint: 'Enter Hospital Phone Number',
              label: 'Hospital Phone Number',
              icon: const Icon(CupertinoIcons.phone),
              onChang: (value) {
                controller.phone = int.parse(value);
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //Emergency Number
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              numbersOnly: true,
              hint: 'Enter Emergency Phone Number',
              label: 'Emergency Number',
              icon: const Icon(Icons.emergency),
              onChang: (value) {
                controller.emergencyNumber = int.parse(value);
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //submit
        Padding(
          padding: EdgeInsets.all(screenWidth * .04),
          child: CustomElevatedButton(
            onTap: () async {
              await controller.createHospitalAccount();
              if (controller.done) {
                Get.defaultDialog(
                    content: const Text('Hospital Added successfully'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/super_admin_home');
                          },
                          child: const Text('close'))
                    ]);
              } else {
                Get.defaultDialog(
                    content: const Text(
                        'Something happened wrong please try again and be sure that there is nothing empty'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('close'))
                    ]);
              }
            },
            textColor: Colors.white,
            color: Colors.blueAccent,
            minimanH: screenHeight * .08,
            minimanW: screenWidth * .8,
            hasText: true,
            text: 'submit',
          ),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
      ],
      imageName: kHospital,
    );
  }
}
