import 'package:get/get.dart';
import 'package:my_prod_flutter/modules/splashscreen/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
