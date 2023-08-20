import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:my_prod_flutter/application/exceptions/repositories_exceptions.dart';
import 'package:my_prod_flutter/models/repositories_model.dart';
import 'package:my_prod_flutter/repositories/repositories/repositories_repository.dart';

class RepositoriesRepositoryImpl implements RepositoriesRepository {
  final dio = Dio();
  final log = Logger();
  @override
  Future<List<RepositoriesModel>> getRepositories(String user) async {
    try {
      final result = await dio.get('https://api.github.com/users/$user/repos');

      final repositories = List<RepositoriesModel>.from(
        result.data.map<RepositoriesModel>(
          (value) => RepositoriesModel.fromMap(value),
        ),
      ).toList();

      return repositories;
    } on DioException catch (e) {
      log.e(e);
      return throw RepositoriesNotFoundException();
    }
  }

  @override
  Future<List<RepositoriesModel>> getStarred(String user) async {
    try {
      final result =
          await dio.get('https://api.github.com/users/$user/starred');

      final repositories = List<RepositoriesModel>.from(
        result.data.map<RepositoriesModel>(
          (value) => RepositoriesModel.fromMap(value),
        ),
      ).toList();

      return repositories;
    } on DioException catch (e) {
      log.e(e);
      return throw RepositoriesNotFoundException();
    }
  }
}
