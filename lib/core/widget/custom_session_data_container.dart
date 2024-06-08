import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/constant.dart';

class CustomSessionDataContainer extends StatelessWidget {
  CustomSessionDataContainer({
    super.key,
    required this.inFuture,
    required this.type,
    required this.sessionSpeaker,
    required this.sessionTitle,
    required this.startIn,
    required this.endIn,
    required this.startInHour,
    required this.endInHour,
  });
  bool inFuture;
  String sessionTitle;
  String sessionSpeaker;
  String type;
  String startIn;
  String startInHour;
  String endIn;
  String endInHour;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Center(
      child: Container(
        padding: EdgeInsets.all(screenWidth * .02),
        decoration: BoxDecoration(
          color: inFuture
              ? kMainColor
              : kGrayButton, // Light green background color
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$sessionTitle \n$type',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              sessionSpeaker,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Start: $startIn',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  startInHour,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'End: $endIn',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  endInHour,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
