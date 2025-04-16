import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Save Access Token
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: 'access_token', value: token);
  }

  // Get Access Token
  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'access_token');
  }

  // Delete Access Token
  Future<void> deleteAccessToken() async {
    await _storage.delete(key: 'access_token');
  }





  Future<void> saveUserId(String token) async {
    await _storage.write(key: 'UserId', value: token);
  }



  Future<String?> getUserId() async {
    return await _storage.read(key: 'UserId');
  }

  // Delete Access Token
  Future<void> deleteUserId() async {
    await _storage.delete(key: 'UserId');
  }



}
