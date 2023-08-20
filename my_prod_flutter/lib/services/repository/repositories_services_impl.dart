import 'package:my_prod_flutter/models/repositories_model.dart';
import 'package:my_prod_flutter/repositories/repositories/repositories_repository.dart';
import 'package:my_prod_flutter/services/repository/repositories_services.dart';

class RepositoriesServicesImpl implements RepositoriesServices {
  final RepositoriesRepository _repositoriesRepository;

  RepositoriesServicesImpl({required RepositoriesRepository repository})
      : _repositoriesRepository = repository;

  @override
  Future<List<RepositoriesModel>> getRepositories(String user) async =>
      await _repositoriesRepository.getRepositories(user);

  @override
  Future<List<RepositoriesModel>> getStarred(String user) async =>
      await _repositoriesRepository.getStarred(user);
}
