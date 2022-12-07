import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petize_teste/modules/result/domain/entities/user.dart';
import 'package:petize_teste/modules/result/domain/usecases/get_user.dart';
import 'package:petize_teste/modules/result/presenter/bloc/result_cubit.dart';
import 'package:petize_teste/modules/result/presenter/bloc/states/result_state.dart';

class GetUserMock extends Mock implements GetUserImpl {}

void main() {
  late GetUserMock usecase;
  late User fakeUser;

  setUpAll(() {
    usecase = GetUserMock();
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
      when(() => usecase("user"))
          .thenAnswer((_) async => Future.value(Right(fakeUser)));
      return ResultBloc(usecase);
    },
    act: (cubit) => cubit.getUser("user"),
    expect: () => [
      isA<LoadingResultState>(),
      isA<SuccessResultUserState>(),
    ],
  );
}
