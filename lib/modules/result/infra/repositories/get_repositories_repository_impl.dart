import 'package:petize_teste/modules/result/domain/entities/git_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:petize_teste/modules/result/domain/repositories/get_repositories_repository.dart';
import 'package:petize_teste/modules/result/infra/datasource/get_repositories_datasource.dart';
import 'package:petize_teste/modules/result/infra/errors/result_failure.dart';
import 'package:petize_teste/modules/result/infra/models/git_repository_model.dart';

class GetRepositoriesRepositoryImpl implements GetRepositoriesRepository {
  final GetRepositoriesDatasource datasource;

  GetRepositoriesRepositoryImpl(this.datasource);

  @override
  Future<Either<GitRepositoryFailure, List<GitRepository>>> getRepositories(
      String user) async {
    try {
      final data = await datasource.getRepositories(user);
      final repositories =
          data.map((e) => GitRepositoryModel.fromMap(e)).toList();
      return Right(repositories);
    } on GitRepositoryDataServiceFailure catch (e) {
      throw GitRepositoryDataRetrieveFailure(e.message);
    } catch (e) {
      throw GitRepositoryDataRetrieveFailure(e.toString());
    }
  }
}
