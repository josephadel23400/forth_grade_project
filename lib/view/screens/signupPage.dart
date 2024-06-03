import 'package:clinic_project/controller/sginUpController.dart';
import 'package:clinic_project/view/widget/customElevatedButton.dart';
import 'package:clinic_project/view/widget/customListPicker%20.dart';
import 'package:clinic_project/view/widget/customScaffold.dart';
import 'package:clinic_project/view/widget/text_form_feild.dart';
import 'package:clinic_project/view/widget/text_form_feild_with_suffix.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
      imageName: ("images/signup.jpg"),
      widgetList: [
        SizedBox(height: screenHeight * .05),
        //title
        Row(
          children: [
            SizedBox(width: screenWidth * .04),
            Text(
              "Sign UP",
              style: TextStyle(
                  fontSize: screenWidth * .09,
                  fontWeight: FontWeight.w700,
                  color: kMainFontBold),
            ),
          ],
        ),
        SizedBox(height: screenHeight * .03),
        //name
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: "Name",
              label: "Enter Name",
              icon: const Icon(Icons.person_outline_outlined),
              onChang: (value) {
                controller.name = value;
              },
              isSecure: false),
        ),
        //email
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: "Email",
              label: "Enter Email",
              icon: const Icon(Icons.email_outlined),
              onChang: (value) {
                controller.email = value;
              },
              isSecure: false),
        ),
        //password
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: GetBuilder(
            init: controller,
            builder: (controller) => CustomTextFormFieldWithSuffix(
              hint: "Password",
              label: "Enter Password",
              icon: const Icon(Icons.lock_outline),
              onChang: (value) {
                controller.password = value;

              },
              isSecure: controller.isSecure,
              suffixIcon: IconButton(
                  icon: controller.isSecure
                      ? const Icon(CupertinoIcons.eye_fill)
                      : const Icon(CupertinoIcons.eye),
                  onPressed: () {
                    controller.showPassword();
                  }),
            ),
          ),
        ),
        //age
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              numbersOnly: true,
              hint: "Age",
              label: "Enter Age",
              icon: const Icon(Icons.person_outline_outlined),
              onChang: (value) {
                controller.age = int.tryParse(value);
              },
              isSecure: false),
        ),
        //phone
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              numbersOnly: true,
              hint: "Phone",
              label: "Enter Phone number",
              icon: const Icon(Icons.phone),
              onChang: (value) {
                controller.phone=int.tryParse(value);
              },
              isSecure: false),
        ),
        //ID
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
            numbersOnly: true,
              hint: "ID",
              label: "Enter National ID",
              icon: const Icon(Icons.credit_card_sharp),
              onChang: (value) {
              controller.nationalId=int.tryParse(value);
              },
              isSecure: false),
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
              controller.gender=value;
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
        //button
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomElevatedButton(
              color: kMainButton,
              textColor: Colors.white,
              onTap: () async{
                print(controller.age);
                await controller.createNewUser();
                 controller.addUserData();
                print(controller.password);
                print('\n\n');
                Get.toNamed("/navigator");
              },
              minimanW: screenWidth,
              minimanH: screenHeight * .07),
        ),
        SizedBox(height: screenHeight * .03),
      ],
    );
  }
}
