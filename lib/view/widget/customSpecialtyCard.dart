import 'package:flutter/material.dart';

class SpecialtyCard extends StatelessWidget {
  const SpecialtyCard(
      {super.key,
      required this.onTap,
      required this.name,
      required this.doctorCount});
  final String name;
  final int doctorCount;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * .02),
      child: ElevatedButton(
          onPressed: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.medical_information_sharp),
              const Spacer(),
              Center(child: Text(name)),
              const Spacer(),
              Text('$doctorCount')
            ],
          )),
    );
  }
}
