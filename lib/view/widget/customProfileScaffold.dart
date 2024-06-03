import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant.dart';

class CustomProfileScaffold extends StatelessWidget {
  const CustomProfileScaffold(
      {super.key,
      required this.widgetList,
      required this.imageName,
      this.showBack = false,
      this.profileImage});
  final List<Widget> widgetList;
  final String imageName;
  final String? profileImage;
  final bool showBack;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
                height: screenHeight * .4,
                width: screenWidth,
                child: Image(
                  image: AssetImage(imageName),
                )),
            Positioned(
              bottom: 0,
              height: screenHeight * .75,
              width: screenWidth,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: .5),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: kMainContainer),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widgetList,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * .03, right: screenWidth * .02,
              child: showBack
                  ? IconButton(
                      icon: Icon(
                        Icons.close_sharp,
                        color: Colors.black,
                        size: screenWidth * .1,
                      ),
                      color: Colors.black,
                      onPressed: () {
                        Get.back();
                      },
                    )
                  : const SizedBox(), // Use SizedBox as a placeholder if showBack is false
            ),
            Positioned(
              height: screenHeight * .16,
              top: screenHeight * .24,
              width: screenWidth * .35,
              left: screenWidth * .34,
              child: CircleAvatar(
                radius: screenWidth * .175, // Half of the desired width
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    kBlack,
                    fit:
                        BoxFit.cover, // Ensure the image covers the entire area
                    width: screenWidth *
                        .35, // Match the width of the CircleAvatar
                    height: screenHeight *
                        .24, // Match the height of the CircleAvatar
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
