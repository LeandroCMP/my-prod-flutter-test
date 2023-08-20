import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:my_prod_flutter/application/exceptions/user_exceptions.dart';
import 'package:my_prod_flutter/application/ui/loader/loader_mixin.dart';
import 'package:my_prod_flutter/application/ui/messages/messages_mixin.dart';
import 'package:my_prod_flutter/services/user/user_service.dart';

class HomeController extends GetxController with MessagesMixin, LoaderMixin {
  final UserService _userService;

  HomeController({required UserService userService})
      : _userService = userService;

  final log = Logger();

  final message = Rxn<MessageModel>();
  final loading = false.obs;

  final userController = TextEditingController();

  @override
  void onInit() {
    loaderListener(loading);
    messageListener(message);
    super.onInit();
  }

  @override
  void onClose() {
    userController.dispose();
    super.onClose();
  }

  Future getUser() async {
    try {
      loading(true);
      if (userController.text.isNotEmpty) {
        final result = await _userService.getUser(
          userController.text.toUpperCase(),
        );
        loading(false);
        Get.toNamed('/profile', arguments: result);
      } else {
        throw UserFieldIsEmptyException();
      }
    } on UserNotFoundException catch (e) {
      log.e(e);
      loading(false);
      message(
        MessageModel.error(
          title: 'Erro!',
          message: "O usuário digitado não foi encontrado!",
        ),
      );
    } on UserFieldIsEmptyException catch (e) {
      log.e(e);
      loading(false);
      message(
        MessageModel.error(
          title: 'Erro!',
          message: "O campo usuário está vazio!",
        ),
      );
    } catch (e) {
      log.e(e);
      loading(false);
      message(
        MessageModel.error(
          title: 'Erro!',
          message: "Ocorreu um erro inesperado!",
        ),
      );
    }
  }
}
