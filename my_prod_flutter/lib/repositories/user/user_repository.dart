import 'package:my_prod_flutter/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser(String user);
}
