import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_o/widgets/background_screen_widget.dart';
import 'package:pay_o/widgets/profile_menu_button_widget.dart';

import '../common/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          const BackgroundScreenWidget(
            isRounded: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.3,
                  ),
                  ...listProfileMenuButton(context),
                ],
              ),
            ),
          ),
          Container(
            height: height * 0.3,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  defaultBorderRadius,
                ),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              const AssetImage("assets/jpg/ikis.jpg"),
                          backgroundColor: secondaryColor,
                          radius: 50,
                        ),
                        Positioned(
                          right: 1,
                          bottom: 1,
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/svg/camera.svg"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Krisna Purnama",
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: width * 0.55,
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.verified_rounded,
                            color: Colors.green,
                          ),
                          Text(
                            "Verified Account",
                            style: primaryTextStyle.copyWith(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> listProfileMenuButton(BuildContext context) {
    return [
      const SizedBox(
        height: 20,
      ),
      Text(
        "Account & Security",
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: regular,
          color: secondaryColor,
        ),
      ),
      ProfileMenuButtonWidget(
        iconPath: "account-settings",
        title: "Account Settings",
        onTap: () {},
      ),
      ProfileMenuButtonWidget(
        iconPath: "referral",
        title: "Referral",
        onTap: () {},
      ),
      ProfileMenuButtonWidget(
        iconPath: "coin-reward",
        title: "Coin Reward",
        onTap: () {},
      ),
      ProfileMenuButtonWidget(
        iconPath: "voucher",
        title: "My Vouchers",
        onTap: () {},
      ),
      Text(
        "General",
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: regular,
          color: secondaryColor,
        ),
      ),
      ProfileMenuButtonWidget(
        iconPath: "terms-conditions",
        title: "Terms & Conditions",
        onTap: () {},
      ),
      ProfileMenuButtonWidget(
        iconPath: "privacy-policy",
        title: "Privacy Policy",
        onTap: () {},
      ),
      ProfileMenuButtonWidget(
        iconPath: "customer-service",
        title: "Customer Service",
        onTap: () {},
      ),
      ProfileMenuButtonWidget(
        iconPath: "sign-out",
        title: "Sign Out",
        onTap: () {},
      ),
    ];
  }
}
