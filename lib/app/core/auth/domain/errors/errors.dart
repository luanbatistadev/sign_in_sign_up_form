abstract class IError implements Exception {}

class DataSourceError implements IError {
  @override
  String toString() {
    return 'DataSourceError';
  }
}

class InvalidCredentials implements IError {
  @override
  String toString() {
    return 'Credentials are invalid';
  }
}
