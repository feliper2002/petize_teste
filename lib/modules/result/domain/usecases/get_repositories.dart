import 'package:dartz/dartz.dart';
import 'package:petize_teste/modules/result/domain/entities/git_repository.dart';
import 'package:petize_teste/modules/result/domain/repositories/get_repositories_repository.dart';
import 'package:petize_teste/modules/result/infra/errors/result_failure.dart';

abstract class GetRepositories {
  Future<Either<GitRepositoryFailure, List<GitRepository>>> call(String user);
}

class GetRepositoriesImpl implements GetRepositories {
  final GetRepositoriesRepository repository;

  GetRepositoriesImpl(this.repository);

  @override
  Future<Either<GitRepositoryFailure, List<GitRepository>>> call(
      String user) async {
    if (user.isEmpty) {
      return Left(GitRepositoryUsecaseFailure(
          "O usuário do Github é um campo obrigatório!"));
    }

    return repository.getRepositories(user);
  }
}
