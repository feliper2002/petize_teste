import 'package:dartz/dartz.dart';
import 'package:petize_teste/modules/result/domain/entities/user.dart';

import '../../infra/errors/user_failure.dart';

abstract class GetUserRepository {
  Future<Either<UserFailure, User>> getUser(String user);
}
