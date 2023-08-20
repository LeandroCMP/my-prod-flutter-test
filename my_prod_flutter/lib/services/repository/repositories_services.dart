import 'package:my_prod_flutter/models/repositories_model.dart';

abstract class RepositoriesServices {
  Future<List<RepositoriesModel>> getRepositories(String user);
  Future<List<RepositoriesModel>> getStarred(String user);
}
