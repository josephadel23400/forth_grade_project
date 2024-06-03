import 'package:clinic_project/services/settingService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import 'customHeaderText.dart';

class DataTextDescription extends StatelessWidget {
  DataTextDescription(
      {super.key,
      required this.icon,
      required this.header,
      this.showIcon = false,
      this.function,
      required this.text});
  final IconData icon;
  final String header;
  bool showIcon;
  Function? function;
  VoidCallback? onTap;
  String? text;
  @override
  Widget build(BuildContext context) {
    SettingServices share = Get.find();
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * .01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon),
              SizedBox(
                width: screenWidth * .02,
              ),
              Flexible(
                child: Text(
                  maxLines: 5,
                  header,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kMainFontBold,
                    fontSize: screenWidth * .06,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              const Spacer(),
              showIcon
                  ? IconButton(
                      onPressed: () async {
                        share.share.setString('val', text!);
                        print(share.share.setString('val', text!));
                        text = await Get.bottomSheet(
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
                                      print(
                                          share.share.setString('val', text!));
                                    },
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      // Other decoration properties...
                                    ),
                                    controller:
                                        TextEditingController(text: text),
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
                                  function!();
                                  //controller.update();
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
                      icon: const Icon(Icons.edit))
                  : const SizedBox(
                      width: 1,
                    ),
            ],
          ),
          SizedBox(
            height: screenHeight * .005,
          ),
          Text(
            text!,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: kMainFontBold,
                fontSize: screenWidth * .05),
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }
}
