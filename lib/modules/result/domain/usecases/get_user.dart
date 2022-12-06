import 'package:petize_teste/modules/result/domain/models/user_model.dart';
import 'package:petize_teste/modules/result/domain/repositories/get_user_repository.dart';

abstract class GetUser {
  Future<UserModel> call(String user);
}

class GetUserImpl implements GetUser {
  final GetUserRepository repository;

  GetUserImpl(this.repository);

  @override
  Future<UserModel> call(String user) async {
    return repository.getUser(user);
  }
}
