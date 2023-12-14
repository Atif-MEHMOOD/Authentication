class AppException implements Exception {
  final _prefix;
  final _message;

  AppException([String? prefix, String? message])
      : _prefix = prefix,
        _message = message;

  String toString() {
    return '$_message $_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super('Error During Communication', message);
}

class BadException extends AppException {
  BadException([String? message]) : super('Invalid Request', message);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super('Unauthorised function', message);
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super('Invalid Request', message);
}
