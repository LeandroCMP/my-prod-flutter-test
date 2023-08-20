import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_prod_flutter/application/modules/module.dart';
import 'package:my_prod_flutter/modules/splashscreen/splash_bindings.dart';
import 'package:my_prod_flutter/modules/splashscreen/splash_page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
  ];
}
