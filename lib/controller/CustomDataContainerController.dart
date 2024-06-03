import 'package:get/get.dart';

import '../constant.dart';

class CustomDataContainerController extends GetxController{
  String imagePath (bool hasPhoto,bool isMale){
    String path= hasPhoto
        ? kMaleDoctor  // Asset path for male doctor image
        : (isMale ? kMaleIcon : kFemaleIcon);

    return(path);
  }
}