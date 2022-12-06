import 'package:petize_teste/modules/result/domain/models/user_model.dart';

abstract class GetUserRepository {
  Future<UserModel> getUser(String user);
}
