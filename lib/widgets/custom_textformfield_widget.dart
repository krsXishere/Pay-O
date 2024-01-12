import 'package:flutter/material.dart';
import '../common/theme.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final String label;
  final bool isPasswordField;
  final TextEditingController controller;
  final bool isObsecure;
  final Function() onTap;

  const CustomTextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.label,
    required this.isPasswordField,
    required this.controller,
    this.isObsecure = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return isPasswordField == false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: secondaryTextStyle,
              ),
              TextFormField(
                style: primaryTextStyle.copyWith(color: black),
                cursorColor: tertiary300,
                cursorHeight: 20,
                cursorWidth: 3,
                controller: controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  filled: false,
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: primaryTextStyle.copyWith(
                    fontWeight: regular,
                    color: grey400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: grey500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: grey500,
                    ),
                  ),
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: secondaryTextStyle,
              ),
              TextFormField(
                style: primaryTextStyle.copyWith(color: black),
                cursorColor: tertiary300,
                cursorHeight: 20,
                cursorWidth: 3,
                controller: controller,
                keyboardType: TextInputType.text,
                obscureText: isObsecure,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: onTap,
                    child: Icon(
                      isObsecure ? Icons.visibility_off : Icons.visibility,
                      color: isObsecure ? grey500 : tertiary400,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  filled: false,
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: primaryTextStyle.copyWith(
                    fontWeight: regular,
                    color: grey400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: grey500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: grey500,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
