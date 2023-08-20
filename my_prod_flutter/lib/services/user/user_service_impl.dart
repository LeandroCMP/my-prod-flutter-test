// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_prod_flutter/models/user_model.dart';
import 'package:my_prod_flutter/repositories/user/user_repository.dart';
import 'package:my_prod_flutter/services/user/user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;

  UserServiceImpl({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<UserModel> getUser(String user) async =>
      await _userRepository.getUser(user);
}
