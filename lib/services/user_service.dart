import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pay_o/common/url.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class UserServices {
  AndroidOptions _getAndroidOptions() {
    return const AndroidOptions(
      encryptedSharedPreferences: true,
    );
  }

  Future<UserModel> getUser() async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    String type = "application/json"; 
    String? token = await storage.read(key: "token");
    var response = await http.get(
      Uri.parse(getUserURL),
      headers: {
        "Authorization": token.toString(),
        "Accept": type,
        "Content-Type": type,
      },
    );

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final user = UserModel.fromJson(data['message']);

      return user;
    } else {
      throw Exception("Gagal Get User");
    }
  }
}
