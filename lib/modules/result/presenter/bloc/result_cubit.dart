import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petize_teste/modules/result/domain/usecases/get_repositories.dart';
import 'package:petize_teste/modules/result/domain/usecases/get_user.dart';
import 'package:petize_teste/modules/result/infra/errors/result_failure.dart';
import 'package:petize_teste/modules/result/infra/errors/user_failure.dart';
import 'package:petize_teste/modules/result/presenter/bloc/states/result_state.dart';

class ResultBloc extends Cubit<ResultState> {
  final GetUser _getUserUsecase;
  final GetRepositories _getRepositoriesUsecase;

  ResultBloc(this._getUserUsecase, this._getRepositoriesUsecase)
      : super(InitialResultState());

  getUser(String user) async {
    final response = await _getUserUsecase(user);

    emit(LoadingResultState());

    response.fold(
      (failure) {
        String message = "";
        if (failure is UserDataRetrieveFailure) {
          message = failure.message;
        }
        if (failure is UserDataServiceFailure) {
          message = failure.message;
        }
        if (failure is UserUsecaseFailure) {
          message = failure.message;
        }
        emit(ErrorResultState(message));
      },
      (user) {
        emit(SuccessResultUserState(user));
      },
    );
  }

  getRepositories(String user) async {
    final response = await _getRepositoriesUsecase(user);

    emit(LoadingResultState());

    response.fold(
      (failure) {
        String message = "";
        if (failure is GitRepositoryUsecaseFailure) {
          message = failure.message;
        }
        if (failure is GitRepositoryDataServiceFailure) {
          message = failure.message;
        }
        if (failure is GitRepositoryDataRetrieveFailure) {
          message = failure.message;
        }
        emit(ErrorResultState(message));
      },
      (repositories) {
        repositories
            .sort((a, b) => b.stargazersCount.compareTo(a.stargazersCount));
        emit(SuccessResultReposState(repositories));
      },
    );
  }
}
