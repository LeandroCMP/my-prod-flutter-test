import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_prod_flutter/application/modules/module.dart';
import 'package:my_prod_flutter/modules/profile/profile_bindings.dart';
import 'package:my_prod_flutter/modules/profile/profile_page.dart';

class ProfileModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/profile',
      page: () => const ProfilePage(),
      binding: ProfileBindings(),
    ),
  ];
}
