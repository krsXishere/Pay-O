import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pay_o/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final authService = AuthService();
  bool _isObsecure = true;
  bool get isObsecure => _isObsecure;
  bool _isLoading = false;
  bool _isObsecureConfirmation = false;
  bool get isObsecureConfirmation => _isObsecureConfirmation;
  bool get isLoading => _isLoading;
  int _statusCode = 0;
  int get statusCode => _statusCode;
  String? _token = "";
  String? get token => _token;

  AndroidOptions _getAndroidOptions() {
    return const AndroidOptions(
      encryptedSharedPreferences: true,
    );
  }

  checkObsecure() {
    _isObsecure = !_isObsecure;
    notifyListeners();
  }

  checkObsecureConfirmation() {
    _isObsecureConfirmation = !_isObsecureConfirmation;
    notifyListeners();
  }

  checkLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> signIn(
    String email,
    String password,
  ) async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    checkLoading(true);
    try {
      await authService
          .signIn(
            email,
            password,
          )
          .then((value) => _statusCode = value);
      _token = await storage.read(key: "token");
      // String? value = await storage.read(key: "token");
      // print("Token: $value");

      return true;
    } catch (e) {
      checkLoading(false);

      return false;
    }
  }
}
