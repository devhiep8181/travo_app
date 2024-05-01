class ServerException implements Exception {
  const ServerException(this._message,);
  final String? _message;

  String? get message => _message;

  @override
  String toString() => '$_message';
}

class CacheException implements Exception {}

class OfflineException implements Exception {}
