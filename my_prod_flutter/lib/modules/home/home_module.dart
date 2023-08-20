import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_prod_flutter/application/modules/module.dart';
import 'package:my_prod_flutter/modules/home/home_bindings.dart';
import 'package:my_prod_flutter/modules/home/home_page.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
