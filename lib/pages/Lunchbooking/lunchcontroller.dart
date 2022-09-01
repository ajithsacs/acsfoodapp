import 'dart:convert';

import 'package:acsfoodapp/const/resourceconst.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LunchController extends GetxController {
  var isbooked = false.obs;
  var isloading = false.obs;
  booked() {
    isbooked.toggle();
  }

  var noselected = 'chapathi'.obs;
  var selected = "".obs;
  RxList mainiteams = [].obs;
  RxList extraiteam = [].obs;
  booklunch() async {
    // print(selected);
    var foodoption = mainiteams.indexOf(selected.value) + 1;
    print(foodoption);
    var key = await getusercredential();
    var getbody = await postbody(foodoption);
    var body = jsonEncode(getbody);
    //print(body.runtimeType);
    try {
      final response = await http.post(
        Uri.parse(
          Resource.baseurl + Resource.booking,
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Basic $key",
        },
        body: body,
      );
      //print(await response);

      if (response.statusCode == 200) {
        DateTime currentDate = DateTime.now();
        var currentdate = DateFormat("yyyy-MM-dd").format(
            DateTime(currentDate.year, currentDate.month, currentDate.day));
        var data = jsonDecode(response.body);
        var newdata = data["id"];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(currentdate.toString(), newdata.toString());
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return -1;
    }
  }

  init() async {
    var responce = await _menuapi();
    var costumfile = responce["custom_fields"];
    // var maindish= costumfile["id"];
    var mainoptions = await costumfile.firstWhere((item) {
      return item['id'] == 41;
    });
    var extraoption = await costumfile.firstWhere((item) {
      return item['id'] == 47;
    });

    var mainfooditem = mainoptions["possible_values"];
    var extrafooditem = extraoption["possible_values"];
    print(mainfooditem.length);
    print(extrafooditem);
    for (var item in mainfooditem) {
      var labeitem = item["label"];
      mainiteams.add(labeitem);
    }
    for (var extra in extrafooditem) {
      var labeitem = extra["label"];
      extraiteam.add(labeitem);
    }
  }

  getusercredential() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.getString('key');
    return key;
  }

  postbody(foodcode) {
    return {
      "time_entry": {
        "project_id": 342,
        "hours": 0,
        "activity_id": 16,
        "custom_fields": [
          {"id": 39, "value": 1},
          {"id": 41, "value": foodcode},
          {"id": 59, "value": "Non Billable"}
        ],
        "comments": ""
      }
    };
  }

  cancell() async {
    var key = await getusercredential();
    DateTime currentDate = DateTime.now();
    var currentdate = DateFormat("yyyy-MM-dd")
        .format(DateTime(currentDate.year, currentDate.month, currentDate.day));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString(currentdate.toString());
    try {
      final response = await http.delete(
          Uri.parse(
              Resource.baseurl + Resource.lunchCancellingUrl + id! + ".json"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Basic $key",
          });
      if (response.statusCode == 204) {
        prefs.remove(currentdate.toString());
        booked();
      }
    } catch (e) {
      return -1;
    }
  }

  _menuapi() async {
    try {
      final responce = await http.get(
          Uri.parse(
            Resource.baseurl + Resource.menuiteam,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Basic YXBpX3VzZXI6QWNzQDIwMTc=",
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
}
