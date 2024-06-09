import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDataViewBox extends StatelessWidget {
  CustomDataViewBox({
    super.key,
    required this.content,
    required this.label,
    this.canModify = false,
    required this.onTap,
  });
  String label;
  String content;
  bool canModify;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * .02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * .04,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenWidth * .01),
          Container(
            padding: EdgeInsets.all(screenWidth * .04),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: SizedBox(
              height: screenHeight*.042,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      content,
                      style: TextStyle(
                        fontSize: screenWidth * .045,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  //const Spacer(),
                  if (canModify)
                    SizedBox(
                      //height: screenHeight * .02,
                      //width: screenWidth * .04,
                      child: IconButton(
                        color: Colors.black,
                        //alignment: Alignment.centerRight,
                        onPressed: onTap,
                        icon: SizedBox(
                          height: screenHeight*.02,
                          child: const Icon(Icons.mode_edit_outlined),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
