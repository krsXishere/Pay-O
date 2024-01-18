// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pay_o/common/url.dart';

class AuthService {
  AndroidOptions _getAndroidOptions() {
    return const AndroidOptions(
      encryptedSharedPreferences: true,
    );
  }

  Future<int> signIn(
    String email,
    String password,
  ) async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    var rawBody = {
      "email": email,
      "password": password,
    };
    var body = jsonEncode(rawBody);
    var response = await http.post(
      Uri.parse("http://192.168.1.8:9000/login"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: body,
    );
    

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      print("Token: ${jsonObject['token']}");
      await storage.write(key: "token", value: jsonObject['token'].toString());

      return response.statusCode;
    } else {
      throw Exception("Gagal Sign In\nError: ${response.statusCode}");
    }
  }

  Future<int> signUp(
    String name,
    String email,
    String password,
    int phone,
  ) async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    var rawBody = {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    };
    var body = jsonEncode(rawBody);
    var response = await http.post(
      Uri.parse("http://192.168.1.8:9000/register"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: body,
    );

    print("URL API: ${response.statusCode}");

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      print("Token: ${jsonObject['token']}");
      await storage.write(key: "token", value: jsonObject['token'].toString());

      return response.statusCode;
    } else {
      throw Exception("Gagal Sign Up\nError: ${response.statusCode}");
    }
  }
}
