import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petize_teste/modules/result/domain/usecases/get_repositories.dart';
import 'package:petize_teste/modules/result/domain/usecases/get_user.dart';
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
        emit(ErrorResultState());
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
        emit(ErrorResultState());
      },
      (repositories) {
        emit(SuccessResultReposState(repositories));
      },
    );
  }
}
