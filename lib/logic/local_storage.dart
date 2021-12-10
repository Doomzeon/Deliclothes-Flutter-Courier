

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageSecure{

  static final _secure_storage = FlutterSecureStorage();


  static Future setUser(dynamic data) async {
    await _secure_storage.write(key: 'user', value: data.toString());
    print('Inserted with success id user ');
  }

  static Future<String> readUser() async {
    print(await _secure_storage.read(key: 'user'));
    return await _secure_storage.read(key: 'user');
  }
}