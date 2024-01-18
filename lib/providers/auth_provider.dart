import 'package:flutter/material.dart';
import 'package:pay_o/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final authService = AuthService();
  bool _isObsecure = true;
  bool get isObsecure => _isObsecure;
  bool _isLoading = false;
  bool _isObsecureConfirmation = true;
  bool get isObsecureConfirmation => _isObsecureConfirmation;
  bool get isLoading => _isLoading;
  int _statusCode = 0;
  int get statusCode => _statusCode;
  int _indexTab = 0;
  int get indexTab => _indexTab;
  String _enteredPin = "";
  String get enteredPin => _enteredPin;

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
    checkLoading(true);
    try {
      _statusCode = await authService.signIn(
        email,
        password,
      );
      checkLoading(false);

      return true;
    } catch (e) {
      checkLoading(false);

      return false;
    }
  }

  Future<bool> signUp(
    String name,
    String email,
    String password,
    int phone,
  ) async {
    checkLoading(true);
    try {
      _statusCode = await authService.signUp(
        name,
        email,
        password,
        phone,
      );
      checkLoading(false);

      return true;
    } catch (e) {
      checkLoading(false);

      return false;
    }
  }
}
