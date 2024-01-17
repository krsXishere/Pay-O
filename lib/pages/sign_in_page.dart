import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_o/common/theme.dart';
import 'package:pay_o/pages/register_page.dart';
import 'package:pay_o/providers/auth_provider.dart';
import 'package:pay_o/widgets/custom_button_auth_widget.dart';
import 'package:pay_o/widgets/custom_textformfield_widget.dart';
import 'package:pay_o/widgets/navigation_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider signInProvider = Provider.of<AuthProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    showSnackBar(
      String message,
      Color color,
    ) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(
            message,
            style: primaryTextStyle.copyWith(
              color: white,
            ),
          ),
        ),
      );
    }

    navigate() {
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          child: const NavigationBarWidget(),
          type: PageTransitionType.rightToLeft,
        ),
        (Route<dynamic> route) => false,
      );
    }

    signIn() async {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        if (await signInProvider.signIn(
          emailController.text,
          passwordController.text,
        )) {
          navigate();
        } else {
          showSnackBar(
            "Gagal masuk!\nError: ${signInProvider.statusCode}",
            Colors.red,
          );
        }
      } else {
        showSnackBar(
          "Isi semua data!",
          Colors.red,
        );
      }
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Text(
                    "Sign In",
                    style: primaryTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: height * 0.15,
                  ),
                ],
              ),
              Positioned(
                top: height * 0.3,
                child: Container(
                  height: height * 0.7,
                  width: width,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child:
                                    SvgPicture.asset("assets/svg/cancel.svg"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          CustomTextFormFieldWidget(
                            hintText: "Enter your email address",
                            label: "Email",
                            isPasswordField: false,
                            controller: emailController,
                            onTap: () {},
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          CustomTextFormFieldWidget(
                            hintText: "Enter your password",
                            label: "Password",
                            isPasswordField: true,
                            controller: passwordController,
                            isObsecure: value.isObsecure,
                            onTap: () {
                              value.checkObsecure();
                            },
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Forgot Password?",
                                  style: secondaryTextStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          CustomButtonAuthWidget(
                            text: "Sign In",
                            color: primaryColor,
                            isLoading: value.isLoading,
                            onPressed: () {
                              signIn();
                            },
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          Text(
                            "Or",
                            style: secondaryTextStyle,
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          CustomButtonAuthWidget(
                            text: "Sign In with Google",
                            color: primaryColor,
                            isLoading: false,
                            isGoogle: true,
                            onPressed: () {},
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't you have an account?",
                                style: primaryTextStyle.copyWith(
                                  color: black,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    PageTransition(
                                      child: const RegisterPage(),
                                      type: PageTransitionType.rightToLeft,
                                    ),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                child: Text(
                                  "Sign Up",
                                  style: primaryTextStyle.copyWith(
                                    color: tertiary500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
