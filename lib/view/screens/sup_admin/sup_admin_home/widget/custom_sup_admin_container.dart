import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constant.dart';
import '../../../../widget/dataTextDiscrition.dart';

class SupAdminContainer extends StatelessWidget {
  const SupAdminContainer(
      {super.key,
      required this.image,
      required this.header,
      required this.text,
      required this.icon,
      required this.onTap});
  final String image;
  final String header;
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * .025),
        child: Container(
          decoration: BoxDecoration(
            color: kGray,
            borderRadius: kBorder10,
          ),
          width: screenWidth,
          height: screenHeight * .22,
          child: Row(
            children: [
              SizedBox(
                width: screenWidth * .015,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  width: screenWidth * .55,
                  child: Center(
                    child: DataTextDescription(
                        icon: icon, text: text, header: header),
                  ),
                ),
              ),
              ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    height: screenHeight * 0.18,
                    width: screenWidth * 0.35,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
