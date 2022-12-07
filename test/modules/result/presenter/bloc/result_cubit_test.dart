import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petize_teste/modules/result/domain/entities/user.dart';
import 'package:petize_teste/modules/result/domain/usecases/get_repositories.dart';
import 'package:petize_teste/modules/result/domain/usecases/get_user.dart';
import 'package:petize_teste/modules/result/presenter/bloc/result_cubit.dart';
import 'package:petize_teste/modules/result/presenter/bloc/states/result_state.dart';

class GetUserMock extends Mock implements GetUserImpl {}

class GetRepositoriesMock extends Mock implements GetRepositoriesImpl {}

void main() {
  late GetUserMock getUser;
  late GetRepositoriesMock getRepositories;
  late User fakeUser;

  setUpAll(() {
    getUser = GetUserMock();
    getRepositories = GetRepositoriesMock();
    fakeUser = User(
      login: 'login',
      name: 'name',
      bio: 'bio',
      twitterUsername: 'twitterUsername',
      location: 'location',
      blog: 'blog',
      siteAdmin: false,
      company: 'company',
      email: 'email',
      followers: 100,
      following: 200,
    );
  });

  blocTest<ResultBloc, ResultState>(
    "Should emit SuccessResultUserState entity by calling usecase.",
    build: () {
      when(() => getUser("user"))
          .thenAnswer((_) async => Future.value(Right(fakeUser)));
      return ResultBloc(getUser, getRepositories);
    },
    act: (cubit) => cubit.getUser("user"),
    expect: () => [
      isA<LoadingResultState>(),
      isA<SuccessResultUserState>(),
    ],
  );
}
