import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_prod_flutter/application/ui/theme_extensions.dart';
import 'package:my_prod_flutter/modules/profile/profile_controller.dart';
import 'package:my_prod_flutter/modules/profile/responsive/is_desktop.dart';
import 'package:my_prod_flutter/modules/profile/responsive/is_phone.dart';
import 'package:my_prod_flutter/modules/profile/responsive/is_tablet.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.stateGrey,
        elevation: 0,
        title: const Row(
          children: [
            Hero(
              tag: 'logo',
              child: Icon(
                FontAwesomeIcons.github,
                size: 35,
              ),
            ),
            SizedBox(width: 10),
            Text('Github Profiles'),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1340) {
            return IsDesktop();
          }
          if (constraints.maxWidth < 1340 && constraints.maxWidth >= 540) {
            return IsTablet();
          } else {
            return IsPhone();
          }
        },
      ),
    );
  }
}
