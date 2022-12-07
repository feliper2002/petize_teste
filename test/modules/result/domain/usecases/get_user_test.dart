import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petize_teste/modules/result/domain/entities/user.dart';
import 'package:petize_teste/modules/result/domain/repositories/get_user_repository.dart';
import 'package:petize_teste/modules/result/domain/usecases/get_user.dart';
import 'package:petize_teste/modules/result/infra/errors/user_failure.dart';

class GetUserRepositoryMock extends Mock implements GetUserRepository {}

void main() {
  late GetUser usecase;
  late GetUserRepositoryMock repository;

  late User fakeUser;

  setUpAll(() {
    repository = GetUserRepositoryMock();
    usecase = GetUserImpl(repository);

    fakeUser = User(
      login: 'login',
      avatarUrl: 'login',
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

  test("Should return User entity by parsing user string", () async {
    when(() => repository.getUser("feliper2002"))
        .thenAnswer((_) async => Right(fakeUser));

    final response = await usecase("feliper2002");

    expect(response.fold(id, id), isA<User>());
  });

  test("Should throw an UserUsecaseFailure if user string is empty", () async {
    when(() => repository.getUser(""))
        .thenThrow((_) async => Left(UserUsecaseFailure("")));

    final response = await usecase("");

    expect(response.fold(id, id), isA<UserUsecaseFailure>());
  });
}
