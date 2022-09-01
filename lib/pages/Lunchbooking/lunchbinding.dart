import 'package:acsfoodapp/pages/Lunchbooking/lunchcontroller.dart';
import 'package:get/get.dart';

class LunchBinging extends Bindings
{
  @override
  void dependencies() {
   Get.lazyPut(() => LunchController());
  }

}