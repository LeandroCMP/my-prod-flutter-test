import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_prod_flutter/application/bindings/application_bindings.dart';
import 'package:my_prod_flutter/modules/home/home_module.dart';
import 'package:my_prod_flutter/modules/profile/profile_module.dart';
import 'package:my_prod_flutter/modules/splashscreen/splash_module.dart';
import 'package:my_prod_flutter/application/ui/my_prod_ui_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyProdUiConfig.title,
      theme: MyProdUiConfig.theme,
      initialBinding: ApplicationBindings(),
      getPages: [
        ...SplashModule().routers,
        ...HomeModule().routers,
        ...ProfileModule().routers,
      ],
    );
  }
}
