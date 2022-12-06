import 'package:petize_teste/modules/result/domain/models/user_model.dart';
import 'package:petize_teste/modules/result/domain/repositories/get_user_repository.dart';
import 'package:petize_teste/modules/result/infra/datasource/get_user_datasource.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  final GetUserDatasource datasource;

  GetUserRepositoryImpl(this.datasource);
  @override
  Future<UserModel> getUser(String user) async {
    try {
      final data = await datasource.getUser(user);
      return UserModel.fromMap(data);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
