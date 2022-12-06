abstract class UserFailure {}

class UserDataRetrieveFailure extends UserFailure {
  final String message;

  UserDataRetrieveFailure(this.message);
}

class UserUsecaseFailure extends UserFailure {
  final String message;

  UserUsecaseFailure(this.message);
}

class UserDataServiceFailure extends UserFailure {
  final String message;

  UserDataServiceFailure(this.message);
}
