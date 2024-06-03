// colors
import 'dart:ui';

import 'package:flutter/cupertino.dart';

Color kMainColor = const Color(0xFFD5F8E5);






// colors
//Color kMainColor = const Color(0xFFD2E2FC);
Color kMainContainer = const Color(0xFFFFFFFF);
Color kMainFontBold = const Color(0xFF424242);
Color kMainButton = const Color(0xFF82B1FF);
Color kOrange = const Color(0xffF67C01);
Color kGray = CupertinoColors.lightBackgroundGray.withOpacity(.3);

//images
String kDoctorsImage = "images/Doctors-rafiki.png";
String kDoctor = "images/doctor.jpg";
String kDoctors = "images/Doctors-rafiki.png";
String kDoctorHeart = "images/Doctor-rafiki.png";
String kDoctorDetails = "images/Online Doctor-rafiki.png";
String kFemaleDoctor = "images/femaleDoctor.jpg";
String kMaleDoctor = "images/maleDoctor.jpg";
String kMedicalIcon = "images/medical_services_FILL0_wght200_GRAD0_opsz24.png";
String kMedicalFilledIcon = "images/medical_services_FILL1_wght200_GRAD0_opsz24.png";
String kHeart = "images/ecg_heart_FILL0_wght200_GRAD0_opsz48.svg";
String kHeartFilled = "images/ecg_heart_FILL1_wght200_GRAD0_opsz48.svg";
String kMaleIcon = "images/man_FILL0_wght400_GRAD0_opsz24.svg";
String kFemaleIcon = "images/woman_FILL0_wght400_GRAD0_opsz24.svg";
String kHospitalImage = "images/home_health_FILL1_wght200_GRAD0_opsz24.svg";
String kDoctorNurse ="images/Insurance-rafiki.png";
String kProfile ="images/Profile Interface-rafiki.png";
String kBlack ="images/A_black_image.jpg";
String kGoodBye ="images/curiosity-rafiki.png";
String kHospital ="images/Hospital building-rafiki.png";
// something else
BorderRadiusGeometry kBorder10=const BorderRadius.all(Radius.circular(10));

// Size
class Size{
  dynamic size;
  dynamic height;
  dynamic width;

  Size(BuildContext context){
    size = MediaQuery.of(context).size;
    width=size.width;
    height=size.hight;
  }
}