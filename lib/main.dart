import 'package:acsfoodapp/const/routeconst.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: Routeconst.initalpath,
      debugShowCheckedModeBanner: false,
      getPages: Routeconst.route,
    ),
  );
}
