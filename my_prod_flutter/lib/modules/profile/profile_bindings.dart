import 'package:get/get.dart';
import 'package:my_prod_flutter/modules/profile/profile_controller.dart';
import 'package:my_prod_flutter/repositories/repositories/repositories_repository.dart';
import 'package:my_prod_flutter/repositories/repositories/repositories_repository_impl.dart';
import 'package:my_prod_flutter/services/repository/repositories_services.dart';
import 'package:my_prod_flutter/services/repository/repositories_services_impl.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepositoriesRepository>(
      () => RepositoriesRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<RepositoriesServices>(
      () => RepositoriesServicesImpl(repository: Get.find()),
      fenix: true,
    );
    Get.put(ProfileController(services: Get.find()));
  }
}
