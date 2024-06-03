import 'package:clinic_project/constant.dart';
import 'package:flutter/material.dart';

class CustomAppointmentContainer extends StatelessWidget {
  CustomAppointmentContainer(
      {super.key,
      required this.isPassed,
      required this.onTap,
      required this.name,
      required this.time,
      required this.date});

  bool isPassed = false;
  final VoidCallback onTap;
  final String name;
  final String time;
  final String date;

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
          decoration: BoxDecoration(
              color: kMainButton,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          width: screenWidth,
          height: screenHeight * .22,
          child: Row(
            children: [
              ImageIcon(
                isPassed
                    ? const AssetImage('images/Frame 24.png')
                    : const AssetImage('images/Frame 23.png'),
                size: screenWidth * .3,
              ),
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
                      time,
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
