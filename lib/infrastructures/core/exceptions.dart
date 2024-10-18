class NetworkException implements Exception {
  final message = 'Please check your internet connection';

  @override
  String toString() => message;
}

class BackendException implements Exception {
  final message = 'Cannot connect to database.';

  @override
  String toString() => message;
}
