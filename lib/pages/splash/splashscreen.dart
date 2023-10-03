import 'package:acsfoodapp/const/resourceconst.dart';
import 'package:acsfoodapp/pages/splash/splashcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splashview extends GetView<SplashController> {
  Splashview({Key? key}) : super(key: key) {
    controller.onload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SvgPicture.asset(
            'assets/acs_logo.svg',
            placeholderBuilder: (BuildContext context) => Container(
                child: const CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
