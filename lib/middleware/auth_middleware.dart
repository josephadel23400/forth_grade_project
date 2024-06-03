import 'package:clinic_project/services/settingService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Auth_Middleware extends GetMiddleware {
  SettingServices share = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (share.share.getString("id") != null &&
        share.share.getString('role') == 'patient') {
      return const RouteSettings(name: "/navigator");
    } else if (share.share.getString("id") != null &&
        share.share.getString('role') == 'doctor') {
      return const RouteSettings(name: "/doctor_navigator");
    } else if (share.share.getString("id") != null &&
        share.share.getString('role') == 'hospital') {
      return const RouteSettings(name: "/sup_admin_home");
    } else {
      return null;
    }
  }
}
