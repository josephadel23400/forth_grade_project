import 'package:clinic_project/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import 'dataTextDiscrition.dart';

class PersonInformationCard extends StatelessWidget {
  PersonInformationCard({
    super.key,
    required this.text1,
    required this.text2,
    this.hasPhoto = false,
    this.image,
    required this.header1,
    required this.header2,
    required this.icon1,
    required this.icon2,
    required this.gender,
  });
  bool hasPhoto;
  String? image;
  final bool gender ;
  final String text1;
  final String text2;
  final String header1;
  final String header2;
  final IconData icon1;
  final IconData icon2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * .025),
      child: Container(
        decoration: BoxDecoration(
          color: kGray,
          borderRadius: kBorder10,
        ),
        width: screenWidth,
        height: screenHeight * .22,
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * .015,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                width: screenWidth * .55,
                child: Column(
                  children: [
                    DataTextDescription(
                        icon: icon1, text: text1, header: header1),
                    DataTextDescription(
                        icon: icon2, text: text2, header: header2),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: hasPhoto
                  ? Image(
                      image: NetworkImage(image!),
                      fit: BoxFit.cover,
                      height: screenHeight * 0.18,
                      width: screenWidth * 0.35,
                    )
                  : SvgPicture.asset(
                      gender
                          ? kMaleIcon
                          : kFemaleIcon, // Asset path for male/female icon
                      fit: BoxFit.cover,
                      height: screenHeight * 0.158,
                      width: screenWidth * 0.18,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
