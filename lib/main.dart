import 'package:acsfoodapp/const/routeconst.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    GetMaterialApp(
      initialRoute: Routeconst.initalpath,
      debugShowCheckedModeBanner: false,
      getPages: Routeconst.route,
    ),
  );
  FlutterNativeSplash.remove();
}
