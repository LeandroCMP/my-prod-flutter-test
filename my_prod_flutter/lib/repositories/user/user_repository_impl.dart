import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:my_prod_flutter/application/exceptions/user_exceptions.dart';
import 'package:my_prod_flutter/models/user_model.dart';
import 'package:my_prod_flutter/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final dio = Dio();
  final log = Logger();

  @override
  Future<UserModel> getUser(String user) async {
    try {
      final result = await dio.get('https://api.github.com/users/$user');
      final UserModel userResult = UserModel.fromMap(result.data);
      return userResult;
    } on DioException catch (e) {
      log.e(e);
      return throw UserNotFoundException();
    }
  }
}
