import 'package:acsfoodapp/pages/login/logincontroller.dart';
import 'package:get/get.dart';

class Loginbinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}