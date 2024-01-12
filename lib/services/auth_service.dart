import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class AuthService {
  AndroidOptions _getAndroidOptions() {
    return const AndroidOptions(
      encryptedSharedPreferences: true,
    );
  }

  Future<int> signIn(String email, String password) async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    String apiURL = "https://reqres.in/api/login";
    var response = await post(
      Uri.parse(apiURL),
      headers: {
        "Accept": "application/json",
        // "Content-Type": "application/json",
      },
      body: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      // print("Token: ${jsonObject['token']}");
      await storage.write(key: "token", value: jsonObject['token'].toString());

      return response.statusCode;
    } else {
      throw Exception("Gagal Login\nError: ${response.statusCode}");
    }
  }
}
