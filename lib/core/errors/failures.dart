class Failure {
  final String message;
  final String? code;
  const Failure(this.message, {this.code});
}

class ServerFailure extends Failure {
  const ServerFailure([String message = 'Kesalahan server']) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure([String message = 'Kesalahan cache lokal']) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'Tidak ada koneksi internet']) : super(message);
}

class ValidationFailure extends Failure {
  final Map<String, String>? fieldErrors;
  const ValidationFailure(String message, {this.fieldErrors}) : super(message);
}
