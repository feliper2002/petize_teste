abstract class GitRepositoryFailure {}

class GitRepositoryDataRetrieveFailure extends GitRepositoryFailure {
  final String message;

  GitRepositoryDataRetrieveFailure(this.message);
}

class GitRepositoryUsecaseFailure extends GitRepositoryFailure {
  final String message;

  GitRepositoryUsecaseFailure(this.message);
}

class GitRepositoryDataServiceFailure extends GitRepositoryFailure {
  final String message;

  GitRepositoryDataServiceFailure(this.message);
}
