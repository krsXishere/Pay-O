import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pay_o/common/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_o/pages/register_page.dart';
import 'package:pay_o/pages/sign_in_page.dart';
import 'package:pay_o/widgets/custom_button_auth_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: defaultPadding,
                ),
                Container(
                  height: height * 0.6,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Pay-O",
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          color: white,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "Welcome Back",
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                          color: white,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "Hello there, sign in to continue",
                        style: primaryTextStyle,
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      SvgPicture.asset("assets/svg/lock-optimized.svg"),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "Now payments are\n“Smarter” than you think",
                  textAlign: TextAlign.center,
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: CustomButtonAuthWidget(
                    text: "Sign In",
                    color: primaryColor,
                    isLoading: false,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                          child: const SignInPage(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: CustomButtonAuthWidget(
                    text: "Sign Up",
                    color: secondaryColor,
                    isLoading: false,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                          child: const RegisterPage(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
