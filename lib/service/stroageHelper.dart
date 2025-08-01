import 'package:chat_app/Helpers/Extractors.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveProfileImagePath(String path) async {
    await _storage.write(key: 'pfp', value: path);
  }

  static Future<String?> getProfileImagePath() async {
    return await _storage.read(key: 'pfp');
  }

  static Future<void> deleteProfileImagePath() async {
    await _storage.delete(key: 'pfp');
  }
}

class DummyStorageHelper {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveProfileImagePath(String path) async {
    await _storage.write(key: 'Dummypfp', value: path);
  }

  static Future<String?> getProfileImagePath() async {
    return await _storage.read(key: 'Dummypfp');
  }

  static Future<void> deleteProfileImagePath() async {
    await _storage.delete(key: 'Dummypfp');
  }
}

class TokenStorage {
  static final _storage = FlutterSecureStorage();
  
  
  static Future<void> saveAccessToken(response) async {
    final accesstoken = extractAccessFromResponse(response);
    await _storage.write(key: 'accesstoken', value: accesstoken);
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(key: 'accesstoken');
  }

  static Future<void> deleteAccessToken() async {
    await _storage.delete(key: 'accesstoken');
  }

  static Future<void> saveRefreshToken(response) async {
    final refreshToken = extractAccessFromResponse(response);
    await _storage.write(key: 'refreshToken', value: refreshToken);
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refreshToken');
  }

  static Future<void> deleteRefreshToken() async {
    await _storage.delete(key: 'refreshToken');
  }
}
class UserStorage  {

  static final _storage = FlutterSecureStorage();

  static Future<void> saveUser(String? username) async {
    await _storage.write(key: 'username', value: username);
  }

  static Future<String?> getUser() async {
    return await _storage.read(key: 'username');
  }

  static Future<void> deleteUser() async {
    await _storage.delete(key: 'username');
  }
}
