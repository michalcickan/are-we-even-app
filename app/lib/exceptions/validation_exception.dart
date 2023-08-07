class EmailValidationException implements Exception {
  final String message;

  EmailValidationException(this.message);

  @override
  String toString() => 'EmailValidationException: $message';
}

class PasswordsNotMatchingException {
  final String message;

  PasswordsNotMatchingException(this.message);
}

class ValidationException implements Exception {
  final String message;

  ValidationException(
    this.message,
  );

  factory ValidationException.passwordNotMatch() =>
      ValidationException("Passwords don't match");

  factory ValidationException.incorrectEmailFormat() =>
      ValidationException("Email is not a valid format");

  @override
  String toString() => message;
}
