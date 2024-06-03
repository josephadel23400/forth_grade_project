import 'package:flutter/material.dart';

class CustomSmallSign extends StatelessWidget {
   CustomSmallSign({super.key, required this.isNew,required this.letterSpaceing, required this.choise1, required this.choise2});
   bool isNew= true;
   double letterSpaceing = 1;
   final String choise1;
   final String choise2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return RotatedBox(
      quarterTurns: -1, // Rotate the text by 90 degrees clockwise
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth*.028, vertical: screenHeight*.010),
        decoration: BoxDecoration(
          color:isNew?Colors.green:Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Text(
          isNew?choise1:choise2,
          style:  TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: letterSpaceing ,
          ),
        ),
      ),
    );
  }
}
