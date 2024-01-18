import 'package:flutter/material.dart';
import 'package:pay_o/services/user_service.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  final _userService = UserServices();
  UserModel? _user;
  UserModel? get user => _user;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // set user(UserModel? value) {
  //   _user = value;
  //   notifyListeners();
  // }

  Future<bool> getUser() async {
    checkLoading(true);
    try {
      final data = await _userService.getUser();
      _user = data;
      checkLoading(false);

      return true;
    } catch (e) {
      Exception("Gagal Get User!\nError: $e");
      checkLoading(false);

      return false;
    }
  }
}
