import 'package:clinic_project/constant.dart';
import 'package:clinic_project/view/widget/customElevatedButton.dart';
import 'package:clinic_project/view/widget/customHeaderText.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:clinic_project/view/widget/text_form_feild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/customListPicker .dart';
import 'add_doctor_controller.dart';

class AddNewDoctor extends StatelessWidget {
  const AddNewDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewDoctorController controller = Get.put(AddNewDoctorController());
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
              hint: 'Enter Doctor Name',
              label: 'Doctor Name',
              icon: const Icon(CupertinoIcons.person),
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
              hint: 'Enter Doctor Email',
              label: 'Doctor Email',
              icon: const Icon(Icons.email_outlined),
              onChang: (value) {
                controller.email = value;
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
              hint: 'Enter Doctor Password',
              label: 'Doctor Password',
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
        //age
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              numbersOnly: true,
              hint: 'Enter Doctor Age',
              label: 'Doctor Age',
              icon: const Icon(CupertinoIcons.number),
              onChang: (value) {
                controller.age = int.parse(value);
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //specialty
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: 'Enter Doctor Specialty',
              label: 'Doctor Specialty',
              icon: const Icon(Icons.medical_information_sharp),
              onChang: (value) {
                controller.specialty = value;
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //start in
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              numbersOnly: true,
              hint: 'Doctor Shift Start In',
              label: 'Doctor Shift Start In',
              icon: const Icon(Icons.timer),
              onChang: (value) {
                controller.startIn = int.parse(value);
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //end in
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              numbersOnly: true,
              hint: 'Doctor Shift End In',
              label: 'Doctor Shift End In',
              icon: const Icon(Icons.timer_sharp),
              onChang: (value) {
                controller.endIn = int.parse(value);
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //certificate
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: 'Enter Doctor Certificate',
              label: 'Doctor Certificate',
              icon: const Icon(Icons.badge),
              onChang: (value) {
                controller.certificate = value;
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
              hint: 'Enter Doctor Phone Number',
              label: 'Doctor Phone Number',
              icon: const Icon(CupertinoIcons.phone),
              onChang: (value) {
                controller.phone = int.parse(value);
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //national ID
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              numbersOnly: true,
              hint: 'Enter Doctor NationalId',
              label: 'Doctor NationalId',
              icon: const Icon(Icons.credit_card_outlined),
              onChang: (value) {
                controller.nationalId = int.parse(value);
              },
              isSecure: false),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //gender
        GetBuilder(
          init: controller,
          builder: (controller) => CustomListPicker(
            hint: controller.gender ? "male" : "female",
            label: '',
            icon: controller.gender
                ? const Icon(
                    Icons.male,
                    color: Colors.blueAccent,
                  )
                : const Icon(
                    Icons.female,
                    color: Colors.red,
                  ),
            onChanged: (value) {
              controller.gender = value;
            },
            value: controller.gender,
            items: [
              DropdownMenuItem(
                onTap: () {
                  controller.isMale = true;
                  controller.update();
                },
                value: true,
                child: const Text('male'),
              ),
              DropdownMenuItem(
                value: false,
                onTap: () {
                  controller.isMale = false;
                  controller.update();
                },
                child: const Text('female'),
              )
            ],
          ),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        //submit
        Padding(
          padding: EdgeInsets.all(screenWidth * .04),
          child: CustomElevatedButton(
            onTap: () async {
              await controller.createDoctorAccount();
              if (controller.done) {
                Get.defaultDialog(
                    content: const Text('Doctor Added successfully'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/sup_admin_home');
                          },
                          child: const Text('close'))
                    ]);
              } else {
                Get.defaultDialog(
                    content: const Text(
                        'Something wronged pls try again and be sure that there is nothing empty'),
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
      imageName: kDoctorHeart,
    );
  }
}
