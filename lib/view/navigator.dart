import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/view/graduate_student/profile/graduate_profile/student_graduate_home_page.dart';
import 'package:fourth_grade_project/view/graduate_student/profile/student_profile/student_profile_page.dart';
import 'package:fourth_grade_project/view/login/login_page.dart';
import 'package:fourth_grade_project/view/sessions.dart';
import 'package:get/get.dart';

import '../JOBS.dart';

class NavigatorButton extends StatefulWidget {
  const NavigatorButton({super.key});

  @override
  State<NavigatorButton> createState() => _NavigatorButtonState();
}

class _NavigatorButtonState extends State<NavigatorButton> {
  int page = 0;
  List<Widget> pages = [
    const StudentGraduateHomePage(),
    const StudentProfilePage(),
    const Sessions(),
    const Jobs(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      body: pages[page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            page = value;
          });
        },
        enableFeedback: true,
        showUnselectedLabels: true,
        currentIndex: page,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            activeIcon: Icon(CupertinoIcons.house_fill),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle),
            activeIcon: Icon(CupertinoIcons.person_circle_fill),
            label: 'Profile',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            activeIcon: Icon(CupertinoIcons.book_fill),
            label: 'Sessions',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.number_circle),
            activeIcon: Icon(CupertinoIcons.number_circle_fill),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              alignment: Alignment.center,
              iconSize: screenHeight * .028,
              onPressed: () async {
                Get.to(const LogInPage());
              },
              icon: const Icon(Icons.logout),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
