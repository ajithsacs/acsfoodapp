import 'dart:async';

import 'package:acsfoodapp/const/stringconst.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashController extends GetxController {
  onload() async {


    Timer(const Duration(seconds: 4), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var key = prefs.getString(Appstring.userkey);
      if (key == null) {
        Get.offNamed(Appstring.login);
      } else {
        Get.offAllNamed(Appstring.home);
      }
    });
  }
}
