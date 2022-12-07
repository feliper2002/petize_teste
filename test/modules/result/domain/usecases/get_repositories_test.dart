import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petize_teste/modules/result/domain/entities/git_repository.dart';
import 'package:petize_teste/modules/result/domain/repositories/get_repositories_repository.dart';
import 'package:petize_teste/modules/result/domain/usecases/get_repositories.dart';
import 'package:petize_teste/modules/result/infra/errors/result_failure.dart';

class GetRepositoriesRepositoryMock extends Mock
    implements GetRepositoriesRepository {}

void main() {
  late GetRepositories usecase;
  late GetRepositoriesRepositoryMock repository;

  late GitRepository fakeRepository;

  setUpAll(() {
    repository = GetRepositoriesRepositoryMock();
    usecase = GetRepositoriesImpl(repository);

    fakeRepository = GitRepository(
      name: "name",
      description: "description",
      stargazersCount: 0,
      updatedAt: "",
    );
  });

  test("Should return GitRepository entity by parsing user string", () async {
    when(() => repository.getRepositories("feliper2002"))
        .thenAnswer((_) async => Right([fakeRepository]));

    final response = await usecase("feliper2002");

    expect(response.fold(id, id), isA<List<GitRepository>>());
  });

  test("Should throw an GitRepositoryUsecaseFailure if user string is empty",
      () async {
    when(() => repository.getRepositories(""))
        .thenThrow((_) async => Left(GitRepositoryUsecaseFailure("")));

    final response = await usecase("");

    expect(response.fold(id, id), isA<GitRepositoryUsecaseFailure>());
  });
}
