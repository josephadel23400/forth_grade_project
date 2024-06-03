import 'package:clinic_project/model/appointmentData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../../constant.dart';
import '../../../../../model/patientData.dart';

class PatientDataContainer extends StatelessWidget {
  PatientDataContainer({
    super.key,
    required this.onTap,
    required this.patientData,
    required this.appointmentData,
  });
  final VoidCallback onTap;

  PatientData? patientData;
  AppointmentData? appointmentData;
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
                child: patientData!.photo != null
                    ? Image(
                        image: NetworkImage(patientData!.photo),
                        fit: BoxFit.cover,
                        height: screenHeight * 0.24,
                        width: screenWidth * 0.35,
                      )
                    : SvgPicture.asset(
                        patientData!.gender
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
                      patientData!.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.07,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    Text(
                      patientData!.age.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.07,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    Text(
                      // DateFormat('HH:mm')
                      //     .format(controller.nearestNew!.date.toDate()),
                      // date: DateFormat('dd/MM/yyyy')
                      //     .format(controller.nearestNew!.date.toDate()),
                      DateFormat('dd/MM/yyyy')
                          .format(appointmentData!.date.toDate()),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.07,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    Text(
                      DateFormat('HH:mm')
                          .format(appointmentData!.date.toDate()),
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
