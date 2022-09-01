import 'dart:convert';

import 'package:acsfoodapp/const/resourceconst.dart';
import 'package:acsfoodapp/const/stringconst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homecontroller extends GetxController {
  var currentmonth = 0.obs;
  var prevmonthcont = 0.obs;
  var amount = 0.obs;
  var pamount = 0.obs;
  var name = "".obs;
  var month = "".obs;
  var pmonth = "".obs;

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.remove('userid');
     await prefs.remove("key");
  }

  oninit() async {
    var responc = await apicallMonthnow();
    if (responc == 0 || responc == -1) {
      print("api call error");
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var username = prefs.getString('userid');
      name.value = username as String;
      // List spend=responc[]
      Set spendtime = {};
      var timeentry = responc["time_entries"];
      for (var time in timeentry) {
        spendtime.add(time["spent_on"]);
      }

      //print(spendtime.length);

      currentmonth.value = spendtime.length;
      amount.value = spendtime.length * 10;

      //print(name.value);
      //print(responce["total_count"].runtimeType);
    }
    var prevresponc = await apicallprev();
    if (prevresponc == 0 || prevresponc == -1) {
      print("Api error");
    } else {
      Set spendtime = {};
      var timeentry = prevresponc["time_entries"];
      for (var time in timeentry) {
        spendtime.add(time["spent_on"]);
      }
      prevmonthcont.value = spendtime.length;
      pamount.value = spendtime.length * 10;
    }
    var months = DateFormat.MMMM().format(DateTime.now());
    month.value = months;
    DateTime currentDate = DateTime.now();
    var prev = DateTime(currentDate.year, currentDate.month - 1, 1);
    var premonth = DateFormat.MMMM().format(prev);
    pmonth.value = premonth;
  }

  getusercredential() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.getString('key');
    return key;
  }

  apicallMonthnow() async {
    var key = await getusercredential();
    try {
      final responce = await http.get(
          Uri.parse(
            Resource.baseurl + Resource.lunchcountapi + Resource.monthone,
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

  apicallprev() async {
    // DateTime currentDate = DateTime.now();
    // var prevMonth = DateFormat("yyyy-MM-dd")
    //     .format(DateTime(currentDate.year, currentDate.month - 1, 1));

    var key = await getusercredential();
    try {
      final responce = await http.get(
          Uri.parse(
            Resource.baseurl + Resource.lunchcountapi + Resource.prevs_month,
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

  booklunch() {
    DateTime currentDate = DateTime.now();
    var time = DateFormat.Hm().format(currentDate);
    int hour = int.parse(time.split(":")[0]);
    int minute = int.parse(time.split(":")[1]);
    print(hour);
    print(minute);
    if (hour == 24) {
      if (minute == 30) {
        Get.snackbar("Time is up", "Book in redmine sorry for inconvenience",
            icon: Icon(Icons.close, color: Color.fromARGB(255, 165, 17, 17)),
            snackPosition: SnackPosition.TOP,
            snackStyle: SnackStyle.FLOATING);
      } else {
        Get.toNamed(Appstring.foodorder);

        //todo
      }
    } else if (hour >= 24) {
      Get.snackbar("Time is up", "Book in redmine sorry for inconvenience",
          icon: Icon(Icons.close, color: Color.fromARGB(255, 165, 17, 17)),
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING);
    } else {
      Get.toNamed(Appstring.foodorder);
      //to do
      // Get.snackbar("Booking", "Book in",
      //     icon: Icon(Icons.close, color: Color.fromARGB(255, 165, 17, 17)),
      //     snackPosition: SnackPosition.TOP,
      //     snackStyle: SnackStyle.FLOATING);
    }
  }
  // var newtime = TimeOfDay(
  //     hour: int.parse(time.split(":")[0]),
  //     minute: int.parse(time.split(":")[1]));
  // print(newtime);
  // print(newtime.runtimeType);

  // if()
  // {

  // }
}
