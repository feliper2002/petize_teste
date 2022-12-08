import 'package:petize_teste/modules/result/domain/entities/git_repository.dart';
import 'package:petize_teste/modules/result/domain/entities/user.dart';

abstract class ResultState {}

class InitialResultState extends ResultState {}

class LoadingResultState extends ResultState {}

class ErrorResultState extends ResultState {
  final String message;

  ErrorResultState(this.message);
}

class SuccessResultUserState extends ResultState {
  final User user;

  SuccessResultUserState(this.user);
}

class SuccessResultReposState extends ResultState {
  final List<GitRepository> repositories;

  SuccessResultReposState(this.repositories);
}
