class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, 'Unauthorised request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message, 'No Internet Connection');
}

// class AppExceptions implements Exception {
//   final _message;
//   final _prefix;
//
//   AppExceptions([this._message, this._prefix]);
//   String toString() {
//     return "$_prefix$_message";
//   }
// }
//
// class FetchDataException extends AppExceptions {
//   FetchDataException([String? message])
//       : super(message, 'Error during communication');
// }
//
// class BadRequestException extends AppExceptions {
//   BadRequestException([String? message]) : super(message, 'Invalid request');
// }
//
// class UnauthorizedException extends AppExceptions {
//   UnauthorizedException([String? message])
//       : super(message, 'Unauthroized request');
// }
//
// class InvalidInputException extends AppExceptions {
//   InvalidInputException([String? message]) : super(message, 'Invalid request');
// }
