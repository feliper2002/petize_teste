import 'package:petize_teste/modules/result/domain/models/user_model.dart';

abstract class ResultState {}

class InitialResultState extends ResultState {}

class LoadingResultState extends ResultState {}

class ErrorResultState extends ResultState {}

class SuccessResultUserState extends ResultState {
  final UserModel user;

  SuccessResultUserState(this.user);
}

class SuccessResultReposState extends ResultState {}
