import 'package:clinic_project/binding/navigatorBinding.dart';
import 'package:clinic_project/binding/signUpBinding.dart';
import 'package:clinic_project/constant.dart';
import 'package:clinic_project/middleware/auth_middleware.dart';
import 'package:clinic_project/services/settingService.dart';
import 'package:clinic_project/view/screens/doctor/doctor_home_page/doctorHome.dart';
import 'package:clinic_project/view/screens/doctor/navigator/doctor_navigator.dart';
import 'package:clinic_project/view/screens/loginPage.dart';
import 'package:clinic_project/view/screens/patient/navigoterBar.dart';
import 'package:clinic_project/view/screens/patient/patientHomePage.dart';
import 'package:clinic_project/view/screens/signupPage.dart';
import 'package:clinic_project/view/screens/sup_admin/doctors_list/doctors_list.dart';
import 'package:clinic_project/view/screens/sup_admin/sup_admin_home/sup_admin_home.dart';
import 'package:clinic_project/view/screens/super_admin/super_admin_home/super_admin_home.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/sup_admin_doctors_specialty_binding.dart';
import 'controller/logInController.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

Future<SettingServices> initalServices() async {
  return await Get.putAsync(() => SettingServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LogInPageController controller = Get.put(LogInPageController());
    SettingServices share = Get.find();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(buttonColor: kMainButton),
        colorScheme: ColorScheme.fromSeed(seedColor: kMainColor),
        useMaterial3: true,
      ),
      //home: LogInPage(),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: "/",
            page: () => const LogInPage(),
            middlewares: [Auth_Middleware()]),
        GetPage(
            name: "/signup",
            page: () => const SignUpPage(),
            binding: SingUpBinding()),
        GetPage(
          name: "/patient_home",
          page: () => const PatientHomePage(),
        ),
        GetPage(
          name: "/navigator",
          page: () => NavigatorBarPage(),
          binding: NavigatorBinding(),
        ),
        GetPage(
          name: "/doctor_home",
          page: () => const DoctorHome(),
        ),
        GetPage(
          name: "/doctor_navigator",
          page: () => const DoctorNavigator(),
        ),
        GetPage(
          name: "/sup_admin_home",
          page: () => const SupAdminHome(),
        ),GetPage(
          name: "/super_admin_home",
          page: () => const SuperAdminHome(),
        ),
        GetPage(
          name: "/sup_admin_doctors_specialty",
          page: () => const HospitalDoctorsSpecialtyList(
          ),
          binding: HospitalDoctorsSpecialtyListBindings(),
        ),

        //GetPage(
        //   name: "/signup",
        //   page: () => SignUpPage(),
        // ),
      ],
    );
  }
}
