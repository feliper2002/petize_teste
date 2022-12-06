import 'package:dartz/dartz.dart';
import 'package:petize_teste/modules/result/domain/entities/user.dart';
import 'package:petize_teste/modules/result/domain/repositories/get_user_repository.dart';
import 'package:petize_teste/modules/result/infra/errors/user_failure.dart';

abstract class GetUser {
  Future<Either<UserFailure, User>> call(String user);
}

class GetUserImpl implements GetUser {
  final GetUserRepository repository;

  GetUserImpl(this.repository);

  @override
  Future<Either<UserFailure, User>> call(String user) async {
    if (user.isEmpty) {
      return Left(
          UserUsecaseFailure("O usuário do Github é um campo obrigatório!"));
    }

    return await repository.getUser(user);
  }
}
