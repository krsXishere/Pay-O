import 'package:flutter/material.dart';
import '../common/theme.dart';

class CustomSnackBarWidget extends StatelessWidget {
  final String message;
  final Color color;
  
  const CustomSnackBarWidget({
    super.key,
    required this.message,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        style: primaryTextStyle.copyWith(
          color: white,
        ),
      ),
    );
  }
}
