import 'dart:convert';
import 'package:acsfoodapp/const/resourceconst.dart';
import 'package:acsfoodapp/const/stringconst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as d;
class LoginController extends GetxController {
  // Obtain shared preferences.
  var showpassword = true.obs;
  var deletetext = true.obs;
  var loader = true.obs;
  var error = false.obs;

  errormessage() {
    error.toggle();
  }

  makepasswordshoworhide() {
    showpassword.toggle();
  }

  removetext() {
    deletetext.toggle();
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  formsubmit(user, pass) async {
    loader.toggle();
    var key = keygenration(user, pass);
    var responce = await apicall(key);

    if (responce == 0 || responce == -1) {
      loader.toggle();
      username.text = "";
      password.text = "";
      if (responce == -1) {
        Get.snackbar("Error", "invalid No network ",
            icon: Icon(Icons.close, color: Color.fromARGB(255, 165, 17, 17)),
            snackPosition: SnackPosition.TOP,
            snackStyle: SnackStyle.FLOATING);
      } else {
        Get.snackbar("Error", "invalid username or password ",
            icon: Icon(Icons.close, color: Color.fromARGB(255, 165, 17, 17)),
            snackPosition: SnackPosition.TOP,
            snackStyle: SnackStyle.FLOATING);
      }
    } else {
      var name = responce["user"]["firstname"];
      var id=responce['user']['id'].toString();

      loader.toggle();
      SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(Appstring.userkey, key);
        prefs.setString(Appstring.userid, name);
        prefs.setString(Appstring.loginid, id);
      Get.offNamed(Appstring.home);
    }
    //(Appstring.home);
  }
}

keygenration(username, password) {
  var key = base64.encode(utf8.encode(username + ":" + password));
  return key;
}

apicall(key) async {
  try {
    final responce = await http.get(
        Uri.parse(
          Resource.baseurl + Resource.loginendpoint,
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Basic $key",
        });
    if (responce.statusCode == 200) {
      final decodestring = jsonDecode(responce.body);
      return decodestring;
    } else {
      return 0;
    }
  } catch (e) {
    return -1;
  }
}
