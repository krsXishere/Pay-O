import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pay_o/pages/sign_in_page.dart';
import 'package:pay_o/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';
import '../widgets/custom_button_auth_widget.dart';
import '../widgets/custom_textformfield_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                    "Sign Up",
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
                    borderRadius: BorderRadius.circular(15),
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
                            hintText: "088212345678",
                            label: "Phone Number",
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
                          CustomTextFormFieldWidget(
                            hintText: "Enter password confirmation",
                            label: "",
                            isPasswordField: true,
                            controller: confirmationPasswordController,
                            isObsecure: value.isObsecureConfirmation,
                            onTap: () {
                              value.checkObsecureConfirmation();
                            },
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          CustomButtonAuthWidget(
                            text: "Sign Up",
                            color: primaryColor,
                            isLoading: value.isLoading,
                            onPressed: () {},
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
                            text: "Sign Up with Google",
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
                                "Already have an account?",
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
                                      child: const SignInPage(),
                                      type: PageTransitionType.rightToLeft,
                                    ),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                child: Text(
                                  "Sign In",
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
