abstract class IError implements Exception {}

class InvalidText implements IError {
  @override
  String toString() {
    return 'InvalidCredentials';
  }
}

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
