// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fourth_grade_project/core/constant.dart';
// import 'package:fourth_grade_project/core/widget/customScaffold.dart';
// import 'package:fourth_grade_project/core/widget/custom_gesture_detector.dart';
// import 'package:fourth_grade_project/view/graduta_student/profile/student_profile/student_profile_controller.dart';
// import 'package:get/get.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../core/widget/custom_header_text.dart';
// class GraduateProfilePage extends StatelessWidget {
//   const GraduateProfilePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double screenHeight = size.height;
//     double screenWidth = size.width;
//     return Stack(children: [
//       Positioned(
//         bottom: 0,
//         left: 0,
//         right: 0,
//         top: 0,
//         child: CustomScaffold(widgetList: [
//           SizedBox(
//             height: screenHeight * .06,
//           ),
//           //add image
//           Padding(
//             padding: EdgeInsets.fromLTRB(
//               screenWidth * .02,
//               screenHeight * .01,
//               screenWidth * .02,
//               0,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   height: screenHeight * 0.05,
//                   width: screenWidth * 0.39,
//                   child: MaterialButton(
//                     shape: const ContinuousRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                     color: kGrayButton,
//                     onPressed: () async {
//                       controller.image = await controller.pickImage();
//                       controller.update();
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Icon(
//                           Icons.add_photo_alternate_outlined,
//                           color: Colors.black,
//                         ),
//                         Text(
//                           'OpenGallery',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: screenWidth * 0.033,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 //const Spacer(),
//                 SizedBox(
//                   height: screenHeight * 0.05,
//                   width: screenWidth * 0.39,
//                   child: MaterialButton(
//                     shape: const ContinuousRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                     color: kGrayButton,
//                     onPressed: () async {
//                       controller.image = await controller.pickPhoto();
//                       controller.update();
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Icon(
//                           CupertinoIcons.camera,
//                           color: Colors.black,
//                         ),
//                         Text(
//                           'OpenCamera',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: screenWidth * 0.033,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: screenHeight * .015,
//           ),
//           Center(
//             //todo: add here user name
//             child: Text('Jospeh Adel'),
//           ),
//           SizedBox(
//             height: screenHeight * .01,
//           ),
//           Center(
//             //todo : add here user job title (or his specialty)
//             child: Text('Android Developer'),
//           ),
//           SizedBox(
//             height: screenHeight * .03,
//           ),
//           //data
//           CustomGestureDetector(
//             fontSize: screenWidth * .055,
//             onTap: () {
//               //todo : get my past and current enrolled sessions functions
//             },
//             title: 'My Achievements',
//           ),
//           CustomGestureDetector(
//             fontSize: screenWidth * .055,
//             onTap: () {
//               //todo : get my personal information
//             },
//             title: 'Personal information',
//           ),
//           //CustomTextFormFieldWithSuffix(hint: hint, label: label, icon: icon, suffixIcon: suffixIcon, onChang: onChang, isSecure: isSecure)
//         ], imageName: kPersonalData),
//       ),
//       Positioned(
//         top: screenHeight * .14,
//         left: screenWidth * .3,
//         right: screenWidth * .3,
//         child: Center(
//           child: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: Colors.black, // Specify the color of the border
//                 width: 1, // Specify the width of the border
//               ),
//             ),
//             child: //controller.imageUrl == null
//             false
//                 ? const Center(
//               child: CircularProgressIndicator(),
//             )
//                 : CircleAvatar(
//               radius: screenWidth * .175, // Half of the desired width
//               backgroundColor: Colors.transparent,
//               child: ClipOval(
//                 child: controller
//                     .nigga //controller.doctorData[0].photo == null
//                     ? SvgPicture.asset(
//                   kPerson,
//                   fit: BoxFit
//                       .cover, // Ensure the image covers the entire area
//                   width: screenWidth * .5,
//                   height: screenHeight * .19,
//                 )
//                     : Image(
//                   image: NetworkImage(
//                     //TODO: HERE PUT THE IMAGE
//                     '',
//                     //controller.doctorData[0].photo)
//                   ),
//                   fit: BoxFit.cover,
//                   width: screenWidth * .35,
//                   height: screenHeight * .24,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       )
//     ]);
//   }
// }
