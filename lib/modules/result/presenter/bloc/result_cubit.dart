import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petize_teste/modules/result/domain/usecases/get_user.dart';
import 'package:petize_teste/modules/result/presenter/bloc/states/result_state.dart';

class ResultBloc extends Cubit<ResultState> {
  final GetUser _getUserUsecase;

  ResultBloc(this._getUserUsecase) : super(InitialResultState());

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
}
