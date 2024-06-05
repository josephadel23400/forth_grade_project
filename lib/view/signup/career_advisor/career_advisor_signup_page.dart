import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/view/login/login_page.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../../../core/widget/customElevatedButton.dart';
import '../../../core/widget/customScaffold.dart';
import '../../../core/widget/custom_list_picker.dart';
import '../../../core/widget/text_form_feild.dart';
import '../../../core/widget/text_form_feild_with_suffix.dart';
import 'career_advisor_signup_controller.dart';

class CareerAdvisorSignUpPage extends StatelessWidget {
  const CareerAdvisorSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    CareerAdvisorSignUpController controller = Get.put(CareerAdvisorSignUpController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
      imageName: (kPersonalData),
      widgetList: [
        SizedBox(height: screenHeight * .05),
        //title
        Row(
          children: [
            SizedBox(width: screenWidth * .04),
            Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: screenWidth * .09,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
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
                //TODO: add Name FUNCTION HERE
                // controller.name = value;
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
                //TODO: add email FUNCTION HERE

                //controller.email = value;
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
                //TODO: add PASSWORD FUNCTION HERE
                // controller.password = value;
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
        // JOB title
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: "Job",
              label: "Enter Job Title",
              icon: const Icon(Icons.workspace_premium),
              onChang: (value) {
                //TODO: add job title FUNCTION HERE
                //controller.email = value;
              },
              isSecure: false),
        ),
        // certificate
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: "Certificate",
              label: "Enter Certificate",
              icon: const Icon(Icons.ac_unit),
              onChang: (value) {
                //TODO: add Certificate FUNCTION HERE
                //controller.email = value;
              },
              isSecure: false),
        ),
        // Skills
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              hint: "Skills",
              label: "Enter Skills",
              icon: const Icon(Icons.electric_bolt),
              onChang: (value) {
                //TODO: add job title FUNCTION HERE
                //controller.email = value;
              },
              isSecure: false),
        ),
        //age
        // Padding(
        //   padding: EdgeInsets.all(screenWidth * .02),
        //   child: CustomTextFormField(
        //       numbersOnly: true,
        //       hint: "Age",
        //       label: "Enter Age",
        //       icon: const Icon(Icons.person_outline_outlined),
        //       onChang: (value) {
        //        // controller.age = int.tryParse(value);
        //       },
        //       isSecure: false),
        // ),
        //phone
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomTextFormField(
              numbersOnly: true,
              hint: "Phone",
              label: "Enter Phone number",
              icon: const Icon(Icons.phone_outlined),
              onChang: (value) {
                //TODO: add phone FUNCTION HERE
                //  controller.phone=int.tryParse(value);
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
                //TODO: add nationalId FUNCTION HERE
                // controller.nationalId=int.tryParse(value);
              },
              isSecure: false),
        ),
        // Date of birth
        Padding(
          //todo: this do pick the date of birth and put the value in *selectedDate*
          padding: EdgeInsets.all(screenWidth * .02),
          child: GestureDetector(
            onTap: () async {
              await controller.pickDate(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black, // Border color
                  width: .7, // Border width
                ),
                borderRadius: BorderRadius.circular(
                    10), // Optional: if you want sharp corners
              ),
              child: const ListTile(
                leading: Icon(Icons.date_range_outlined),
                title: Text('Date of birth'),
              ),
            ),
          ),
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
                    color: Colors.pinkAccent,
                  ),
            onChanged: (value) {
              // todo: its the gender value  true = male ,false = female
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
        // SizedBox(height: screenHeight * .03),

        SizedBox(height: screenHeight * .03),
        // Sgin Up button
        Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomElevatedButton(
              hasText: true,
              text: 'Sign Up',
              color: kMainButton,
              textColor: Colors.white,
              onTap: () {
                //todo: put the sign up functionality here
                try {
                  //todo: put here the sign up functionality and dont forget to change the True in if statement
                  if (true) {
                  } else {
                    //todo: put the sign up Exception handling
                  }
                } catch (e) {
                  //print(e);
                }
                Get.to(const LogInPage());
                // print(controller.age);
                // await controller.createNewUser();
                // controller.addUserData();
                // print(controller.password);
                // print('\n\n');
                // Get.toNamed("/navigator");
              },
              minimanW: screenWidth,
              minimanH: screenHeight * .07),
        ),
        SizedBox(height: screenHeight * .03),
      ],
    );
  }
}
