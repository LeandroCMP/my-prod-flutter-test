// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prod_flutter/application/ui/loader/loader_mixin.dart';
import 'package:my_prod_flutter/application/ui/messages/messages_mixin.dart';
import 'package:my_prod_flutter/models/repositories_model.dart';
import 'package:my_prod_flutter/models/user_model.dart';
import 'package:my_prod_flutter/services/repository/repositories_services.dart';

class ProfileController extends GetxController with MessagesMixin, LoaderMixin {
  final RepositoriesServices _services;
  ProfileController({
    required RepositoriesServices services,
  }) : _services = services;

  final UserModel user = Get.arguments;

  RxList<RepositoriesModel> repositories = <RepositoriesModel>[].obs;
  RxList<RepositoriesModel> repositoriesCopy = <RepositoriesModel>[].obs;
  RxList<RepositoriesModel> starred = <RepositoriesModel>[].obs;
  RxList<RepositoriesModel> starredCopy = <RepositoriesModel>[].obs;

  final repositoryEC = TextEditingController();
  final starredEC = TextEditingController();

  @override
  void onClose() {
    repositoryEC.dispose();
    super.onClose();
  }

  @override
  Future<void> onInit() async {
    repositories(await _services.getRepositories(user.user));
    repositoriesCopy.assignAll(repositories);
    starred(await _services.getStarred(user.user));
    starredCopy.assignAll(starred);
    repositoryEC.addListener(() {
      Future.delayed(2.seconds, () async {
        filterByNameRepository(repositoryEC.text);
      });
    });
    starredEC.addListener(() {
      Future.delayed(2.seconds, () async {
        filterByNameStarred(starredEC.text);
      });
    });
    super.onInit();
  }

  filterByNameRepository(String name) {
    if (name.isNotEmpty && name != '') {
      var filtered = repositories.where((repositories) {
        return repositories.name.contains(name);
      }).toList();
      repositories.assignAll(filtered);
    } else {
      repositories.assignAll(repositoriesCopy);
    }
  }

  filterByNameStarred(String name) {
    if (name.isNotEmpty) {
      var filtered = starred.where((repositories) {
        return repositories.name.contains(name);
      }).toList();
      starred.assignAll(filtered);
    } else {
      starred.assignAll(starredCopy);
    }
  }
}
