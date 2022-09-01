import 'package:acsfoodapp/pages/home/homecontroller.dart';
import 'package:acsfoodapp/pages/splash/splashcontroller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings
{
  @override
  void dependencies() {
   Get.lazyPut(() => SplashController());
   Get.lazyPut(()=>Homecontroller());
  }

}