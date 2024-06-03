import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant.dart';

class CustomDataContainer extends StatelessWidget {
  const CustomDataContainer(
      {super.key,
      required this.name,
      required this.date,
      required this.specialty,
      required this.photo,
      required this.gender,
      required this.onTap});
  final String name;
  final String specialty;
  final String date;
  final dynamic photo;
  final bool gender;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * .02),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          //padding: EdgeInsets.all(screenWidth * .02),
          decoration:
              BoxDecoration(color: kMainButton, borderRadius: kBorder10),
          width: screenWidth,
          height: screenHeight * .22,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: photo != null
                    ? Image(
                        image: NetworkImage(photo),
                        fit: BoxFit.cover,
                        height: screenHeight * 0.24,
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
              SizedBox(width: screenWidth * 0.05),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.07,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    Text(
                      specialty,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.07,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.07,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
