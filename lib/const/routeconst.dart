import 'package:acsfoodapp/const/stringconst.dart';
import 'package:acsfoodapp/pages/Lunchbooking/lunchbinding.dart';
import 'package:acsfoodapp/pages/Lunchbooking/lunchview.dart';
import 'package:acsfoodapp/pages/home/homebinding.dart';
import 'package:acsfoodapp/pages/home/homeview.dart';
import 'package:acsfoodapp/pages/login/loginbinding.dart';
import 'package:acsfoodapp/pages/login/loginview.dart';
import 'package:acsfoodapp/pages/splash/splashbinding.dart';
import 'package:acsfoodapp/pages/splash/splashscreen.dart';
import 'package:get/get.dart';

class Routeconst {
  Routeconst._();
  static const initalpath = Appstring.intital;
  static final route = [
    GetPage(
      name: initalpath,
      page: () => Splashview(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Appstring.login,
      page: () => LogininView(),
      binding: Loginbinding(),
    ),
    GetPage(
      name: Appstring.home,
      page: () => HomeView(),
      binding: Homebinging(),
    ),
    GetPage(
      name: Appstring.foodorder,
      page: () => LunchView(),
      binding: LunchBinging(),
    )
  ];
}
