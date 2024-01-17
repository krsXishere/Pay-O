import 'package:flutter/material.dart';

class PendingPaymentHistoryProvider with ChangeNotifier {
  bool _isDismiss = false;
  bool get isDismiss => _isDismiss;

  updateDismiss(bool value) {
    _isDismiss = value;
    notifyListeners();
  }
}
