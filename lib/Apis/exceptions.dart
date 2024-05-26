abstract class ApiException implements Exception {
  final String message;
  final List<String> errors;

  ApiException(this.message, this.errors);
}

class ServerException extends ApiException {
  ServerException(String message) : super(message, const []);
}

class ValidationException extends ApiException {
  ValidationException(
    String message,
    List<String> errors,
  ) : super(message, errors);
}
