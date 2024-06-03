
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constant.dart';

class CustomPatientDataContainer extends StatelessWidget {
  const CustomPatientDataContainer(
      {super.key, required this.data, required this.onTap});
  final  data;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * .02),
      child: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration:
                BoxDecoration(color: kMainButton, borderRadius: kBorder10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: data.photo != null
                      ? Image(
                          image: AssetImage(kMaleDoctor),
                          fit: BoxFit.cover,
                          height: screenHeight * 0.158,
                          width: screenWidth * 0.35,
                        )
                      : SvgPicture.asset(
                          data.isMale ? kMaleIcon : kFemaleIcon,
                          fit: BoxFit.cover,
                          height: screenHeight * 0.158,
                          width: screenWidth * 0.18,
                        ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.06,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        Text(
                          'Appointment in : ${data.appointmentTime}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.05,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
