import 'package:dartz/dartz.dart';
import 'package:petize_teste/modules/result/domain/entities/user.dart';
import 'package:petize_teste/modules/result/domain/repositories/get_user_repository.dart';
import 'package:petize_teste/modules/result/infra/datasource/get_user_datasource.dart';

import '../errors/user_failure.dart';
import '../models/user_model.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  final GetUserDatasource datasource;

  GetUserRepositoryImpl(this.datasource);
  @override
  Future<Either<UserFailure, User>> getUser(String user) async {
    try {
      final data = await datasource.getUser(user);
      final model = UserModel.fromMap(data);
      return Right(model);
    } on UserDataServiceFailure catch (e) {
      throw Left(UserDataRetrieveFailure(e.message));
    } catch (e) {
      throw Left(UserDataRetrieveFailure(e.toString()));
    }
  }
}
