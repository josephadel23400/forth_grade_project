import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/view/signup/signup_controller.dart';
import 'package:get/get.dart';

import '../../core/constant.dart';
import '../../core/services/setting_service.dart';
import '../../core/widget/customElevatedButton.dart';
import '../../core/widget/customScaffold.dart';
import '../../core/widget/text_form_feild.dart';
import '../signup/signup_page.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});
  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    // LogInPageController controller = Get.find();
    SettingServices share = Get.find();
    late bool isDoctor = false;
    int hab = 0;
    Size size = Size(context);
    double screenHeight = size.height;
    double screenWidth = size.width;
    return SafeArea(
      child: CustomScaffold(
        imageName: 'image/1.png',
        widgetList: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * .07),
                Row(
                  children: [
                    SizedBox(width: screenWidth * .04),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: screenWidth * .09,
                          fontWeight: FontWeight.w700,
                          color: kMainFontBold),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * .07),
                Padding(
                    padding: EdgeInsets.all(screenWidth * .02),
                    child: CustomTextFormField(
                      isSecure: false,
                      icon: const Icon(CupertinoIcons.person),
                      hint: "Email",
                      label: "Enter Your Email",
                      onChang: (value) {
                        // controller.email = value;
                      },
                    )),
                SizedBox(height: screenHeight * .03),
                // Padding(
                //TODO:
                //   padding: EdgeInsets.all(screenWidth * .02),
                //   child: GetBuilder(
                //     init: controller,
                //     builder: (controller) => CustomTextFormFieldWithSuffix(
                //       hint: "Password",
                //       icon: const Icon(Icons.lock),
                //       isSecure: controller.isSecure,
                //       onChang: (value) {
                //         controller.password = value;
                //       },
                //       label: "Enter Password",
                //       suffixIcon: IconButton(
                //         icon: controller.isSecure
                //             ? const Icon(CupertinoIcons.eye_fill)
                //             : const Icon(CupertinoIcons.eye),
                //         onPressed: () {
                //           controller.showPassword();
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: screenHeight * .06),
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: CustomElevatedButton(
                    color: kMainButton,
                    minimanW: screenWidth * .9,
                    minimanH: screenHeight * .07,
                    onTap: () async {
                      //  //await controller.logIn();
                      // // await controller.role();
                      //  if (controller.user.currentUser != null) {
                      //    share.share
                      //        .setString('id', controller.user.currentUser!.uid);
                      //    share.share.setString('userEmail', controller.email!);
                      //    share.share
                      //        .setString('userPassword', controller.password!);
                      //    if (share.share.getString('role') == 'doctor') {
                      //      Get.to(const DoctorNavigator());
                      //    } else if (share.share.getString('role') == 'patient') {
                      //      Get.offAllNamed("/navigator");
                      //    } else if (share.share.getString('role') ==
                      //        'hospital') {
                      //      Get.offAllNamed("/sup_admin_home");
                      //    } else {
                      //      Get.defaultDialog(
                      //          content: const Text('something wont wrong'),
                      //          actions: [
                      //            TextButton(
                      //                onPressed: () {
                      //                  controller.user.signOut();
                      //                  Get.back();
                      //                },
                      //                child: const Text('close'))
                      //          ]);
                      //    }
                      //  } else if (controller.password == 'super Admin' &&
                      //      controller.email == 'superAdmin@gmail.com') {
                      //    Get.offAllNamed("/super_admin_home");
                      //  } else {
                      //    Get.defaultDialog(actions: [
                      //      TextButton(
                      //          onPressed: () {
                      //            controller.user.signOut();
                      //            Get.back();
                      //          },
                      //          child: const Text('try again'))
                      //    ], content: const Text('email or password are wrong'));
                      //  }
                    },
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * .03),
                Padding(
                  padding: EdgeInsets.all(screenWidth * .02),
                  child: Row(
                    children: [
                      SizedBox(width: screenWidth * .11),
                      Text(
                        "Don't have account ",
                        style: TextStyle(
                          color: kMainFontBold,
                          fontSize: screenWidth * .05,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * .02),
                        child: InkWell(
                          onTap: () {
                            //await controller.user.signOut();

                            Get.to(SignUpPage());
                          },
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: screenWidth * .055,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
