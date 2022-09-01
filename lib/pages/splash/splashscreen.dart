import 'package:acsfoodapp/const/resourceconst.dart';
import 'package:acsfoodapp/pages/splash/splashcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashview extends GetView<SplashController> {
  Splashview({Key? key}) : super(key: key) {
    controller.onload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(Resource.splasgimg),
        ),
      ),
    );
  }
}
