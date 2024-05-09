import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final _storage = const FlutterSecureStorage();

  // functions are string specific
  Future<String?> retrieveFromSecureStorage(String keyToRetrieve) async {
    return await _storage.read(key: keyToRetrieve);
  }

  void setToSecureStorage(String keyToSave, String? valueToSave) {
    _storage.write(key: keyToSave, value: valueToSave);
  }

  void deleteSecureStorage(String keyToDelete) {
    _storage.delete(key: keyToDelete);
  }
}