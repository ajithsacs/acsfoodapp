import 'package:acsfoodapp/pages/Lunchbooking/lunchcontroller.dart';
import 'package:acsfoodapp/pages/home/homecontroller.dart';
import 'package:get/get.dart';

class Homebinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Homecontroller());
    Get.lazyPut(() => LunchController());
  }
}
