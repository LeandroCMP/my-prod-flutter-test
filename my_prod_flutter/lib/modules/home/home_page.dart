import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:my_prod_flutter/application/ui/theme_extensions.dart';
import 'package:my_prod_flutter/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Hero(
              tag: 'logo',
              child: Icon(
                FontAwesomeIcons.github,
                size: 60,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                controller: controller.userController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(05),
                    borderSide: BorderSide(color: context.warmGrey),
                  ),
                  label: Text(
                    'Digite o usuário',
                    style: TextStyle(
                      color: context.warmGrey,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.search_rounded),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => controller.getUser(),
              child: Text(
                'Buscar',
                style: TextStyle(color: context.brownishGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
