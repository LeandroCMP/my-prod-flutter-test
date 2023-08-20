import 'package:my_prod_flutter/models/user_model.dart';

abstract class UserService {
  Future<UserModel> getUser(String user);
}
