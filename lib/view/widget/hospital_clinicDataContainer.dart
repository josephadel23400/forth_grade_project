import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../model/hospital_model.dart';

class Hospital_ClincDataContaliner extends StatelessWidget {
  const Hospital_ClincDataContaliner(
      {super.key, required this.data, required this.onTap});
  final HospitalModel data;
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
        child: Stack(
          children: [
            Container(
              //padding: EdgeInsets.all(screenWidth * .02),
              decoration:
                  BoxDecoration(color: kMainButton, borderRadius: kBorder10),
              width: screenWidth,
              height: screenHeight * .32,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: data.photo == null
                        ? Image(
                            image: AssetImage(kMaleDoctor),
                            fit: BoxFit.cover,
                            height: screenHeight * 0.32,
                            width: screenWidth * 0.35,
                          )
                        : Image(
                            image: NetworkImage(data.photo),
                            fit: BoxFit.cover,
                            height: screenHeight * 0.32,
                            width: screenWidth * 0.35,
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
                            data.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.07,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                          SizedBox(height: screenWidth * 0.01),
                          Text(
                            data.address,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.07,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                          SizedBox(height: screenWidth * 0.01),
                          Text(
                            data.emergencyNumber.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.07,
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
            // Positioned(
            //   right: 0,
            //   bottom: 0,
            //   child: CustomSmallSign(
            //     isNew: controller.isOpen(data.closeTime),
            //     letterSpaceing: 1,
            //     choise1: 'open',
            //     choise2: 'close',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
