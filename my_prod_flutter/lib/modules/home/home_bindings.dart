import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:my_prod_flutter/modules/home/home_controller.dart';
import 'package:my_prod_flutter/repositories/user/user_repository.dart';
import 'package:my_prod_flutter/repositories/user/user_repository_impl.dart';
import 'package:my_prod_flutter/services/user/user_service.dart';
import 'package:my_prod_flutter/services/user/user_service_impl.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<UserService>(
      () => UserServiceImpl(userRepository: Get.find()),
      fenix: true,
    );
    Get.put(HomeController(userService: Get.find()));
  }
}
