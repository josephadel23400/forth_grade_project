import 'package:clinic_project/constant.dart';
import 'package:clinic_project/services/settingService.dart';
import 'package:clinic_project/view/widget/customHeaderText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/PatientProfileController.dart';
import '../../controller/customTextViewController.dart';

class CustomTextView extends StatelessWidget {
  CustomTextView({
    super.key,
    required this.height,
    this.text,
    this.showIcon=false,
    required this.icon,
    required this.header,
    required this.function,
  });
  final double height;
  late String? text;
  final IconData icon;
  final String header;
  final Function  function;
  bool showIcon;

  @override
  Widget build(BuildContext context) {
    SettingServices share = Get.find();
    PatientProfileController controller = Get.put(PatientProfileController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * .02),
      child: GetBuilder<PatientProfileController>(
        init: controller,
        builder: (controller) => Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black, // Specify the color of the border
              width: .5, // Specify the width of the border
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * .01),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .start, // Align children at the start of the row
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Align children at the center along the vertical axis
                children: [
                  SizedBox(width: screenWidth * .02),
                  Icon(icon),
                  SizedBox(
                      width: screenWidth *
                          .05), // Add some space between the Icon and the Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align children at the start of the column
                    children: [
                      Text(
                        header,
                        style: const TextStyle(
                            color: CupertinoColors.inactiveGray),
                      ),
                      SizedBox(
                        width: screenWidth * .6,
                        child: Text(
                          maxLines: null,
                          text == null ? 'Add $header' : text!,
                          style: TextStyle(fontSize: screenWidth * .05),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(), // Pushes the IconButton to the end of the row
                  showIcon?
                  IconButton(
                    onPressed: () {
                      share.share.setString('val', text!);
                      print(share.share.setString('val', text!));
                      Get.bottomSheet(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomHeaderText(text: header),
                            Padding(
                              padding: EdgeInsets.all(screenWidth * .02),
                              child: Container(
                                padding: EdgeInsets.all(screenWidth * .02),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors
                                        .black, // Specify the color of the border
                                    width:
                                        .5, // Specify the width of the border
                                  ),
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    text = value;
                                    share.share.setString('val', text!);
                                    print(share.share.setString('val', text!));
                                  },
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    // Other decoration properties...
                                  ),
                                  controller: TextEditingController(text: text),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                        Color>(
                                    kMainButton), // Set the background color
                              ),
                              onPressed: () {
                                function();
                                controller.update();
                                Get.back();
                                print(share.share.setString('val', text!));
                              },
                              child: const Text(
                                'Confirm',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        shape: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        backgroundColor: CupertinoColors.white,
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ):const SizedBox(height: 1,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
