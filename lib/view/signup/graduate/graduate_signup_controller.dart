import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/constant.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GraduateSignUpController extends GetxController {
  bool isSecure = true;
  bool isMale = true;
  //todo: use these 2 variables in the account data gender / selectedDate
  bool gender = true;
  DateTime? selectedDate;

  void showPassword() {
    isSecure = !isSecure;
    update();
  }
  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.black, // Header background color
              onPrimary: Colors.white, // Header text color
              surface:kMainColor, // Background color of the date picker itself
              onSurface: Colors.black, // Text color of the date picker itself
            ),
            dialogBackgroundColor: Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != selectedDate) {
        selectedDate = pickedDate;
        update();
       // print(selectedDate);
    }
  }
}