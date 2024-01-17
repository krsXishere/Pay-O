import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../common/theme.dart';

class ProfileMenuButtonWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final Function() onTap;

  const ProfileMenuButtonWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: defaultPadding),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/$iconPath.svg",
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        title,
                        style: primaryTextStyle.copyWith(
                          color: primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey[400],
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
