import 'package:dartz/dartz.dart';
import 'package:petize_teste/modules/result/domain/entities/git_repository.dart';
import 'package:petize_teste/modules/result/infra/errors/result_failure.dart';

abstract class GetRepositoriesRepository {
  Future<Either<GitRepositoryFailure, List<GitRepository>>> getRepositories(
      String user);
}
