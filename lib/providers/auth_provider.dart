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
  int _indexTab = 0;
  int get indexTab => _indexTab;
  String _enteredPin = "";
  String get enteredPin => _enteredPin;

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

  checkIndex(int value) {
    _indexTab = value;
    notifyListeners();
  }

  inputPin(int number) {
    if (enteredPin.length < 4) {
      _enteredPin += number.toString();
    }
    notifyListeners();
  }

  addOnsInputPin() {
    if (_enteredPin.isNotEmpty) {
      _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
    }
    notifyListeners();
  }

  resetEnteredPin() {
    _enteredPin = "";
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
      checkLoading(false);
      
      return true;
    } catch (e) {
      checkLoading(false);

      return false;
    }
  }
}
