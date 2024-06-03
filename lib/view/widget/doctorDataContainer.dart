import 'package:clinic_project/model/doctor_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constant.dart';

class DoctorDataContainer extends StatelessWidget {
  const DoctorDataContainer(
      {super.key, required this.onTap, required this.data,});

  final VoidCallback onTap;
  final DoctorsModel data;

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
                  child: data.photo!=null
                      ? Image(
                    image: NetworkImage(data.photo),
                    fit: BoxFit.cover,
                    height: screenHeight * 0.158,
                    width: screenWidth * 0.35,
                  )
                      : SvgPicture.asset(
                   data.gender ? kMaleIcon : kFemaleIcon,
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
                          'Start in : ${data.startIn} to : ${data.endIn}',
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
