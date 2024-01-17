import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pay_o/pages/sign_in_page.dart';
import 'package:pay_o/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';
import '../widgets/custom_button_auth_widget.dart';
import '../widgets/custom_textformfield_widget.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPasswordController =
      TextEditingController();
  int indexTab = 0;

  @override
  void initState() {
    super.initState();
  }

  movePage(
    BuildContext context,
    int index,
  ) {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );
    authProvider.checkIndex(index);
  }

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
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: AnimatedSwitcher(
                        switchInCurve: Curves.easeInOutQuart,
                        switchOutCurve: Curves.easeInOutQuart,
                        duration: const Duration(milliseconds: 500),
                        child: value.indexTab == 0
                            ? tabBarOne(
                                context,
                                value,
                              )
                            : value.indexTab == 1
                                ? tabBarTwo(
                                    context,
                                    value,
                                  )
                                : tabBarThree(
                                    context,
                                    value,
                                  ),
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

  Widget tabBarOne(
    BuildContext context,
    AuthProvider value,
  ) {
    return Column(
      key: const Key("tabBarOne"),
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     GestureDetector(
        //       onTap: () {},
        //       child: SvgPicture.asset(
        //         "assets/svg/cancel.svg",
        //         color: black,
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(
        //   height: defaultPadding,
        // ),
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
          text: "Continue",
          color: primaryColor,
          isLoading: value.isLoading,
          onPressed: () {
            movePage(
              context,
              1,
            );
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
    );
  }

  Widget tabBarTwo(
    BuildContext context,
    AuthProvider value,
  ) {
    return Column(
      key: const Key("tabBarTwo"),
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                movePage(context, 0);
              },
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ],
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Text(
          "Please, enter the OTP code sent to\n+62 88212345678",
          textAlign: TextAlign.center,
          style: secondaryTextStyle,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        OtpTextField(
          numberOfFields: 4,
          borderColor: primaryColor,
          borderRadius: BorderRadius.circular(6),
          showFieldAsBox: true,
          cursorColor: primaryColor,
          obscureText: true,
          onSubmit: (value) {},
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Text(
          "Resend code",
          style: secondaryTextStyle,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        CustomButtonAuthWidget(
          text: "Sign Up",
          color: primaryColor,
          isLoading: false,
          onPressed: () {
            value.checkIndex(2);
          },
        ),
      ],
    );
  }

  Widget tabBarThree(
    BuildContext context,
    AuthProvider value,
  ) {
    return Column(
      key: const Key("tabBarThree"),
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                movePage(context, 1);
              },
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ],
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Text(
          "Set pin for the application for security purpose",
          textAlign: TextAlign.center,
          style: secondaryTextStyle,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        pin(context, value),
        SizedBox(
          height: defaultPadding,
        ),
        for (var i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  3, (index) => numButton(1 + 3 * i + index, value)).toList(),
            ),
          ),
        addOnsNumButton(context, value),
        SizedBox(
          height: defaultPadding,
        ),
        InkWell(
          onTap: () {
            value.resetEnteredPin();
          },
          child: Text(
            "Reset",
            style: secondaryTextStyle,
          ),
        ),
        SizedBox(
          height: defaultPadding,
        ),
        CustomButtonAuthWidget(
          text: "Save",
          color: primaryColor,
          isLoading: false,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget pin(BuildContext context, AuthProvider value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) {
          return Container(
            margin: const EdgeInsets.all(6.0),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: index < value.enteredPin.length
                  ? primaryColor
                  : primaryColor.withOpacity(0.1),
            ),
          );
        },
      ),
    );
  }

  Widget numButton(int number, AuthProvider value) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextButton(
        onPressed: () {
          value.inputPin(number);
        },
        child: Text(
          number.toString(),
          style: secondaryTextStyle.copyWith(
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Widget addOnsNumButton(BuildContext context, AuthProvider value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextButton(
            onPressed: null,
            child: SizedBox(),
          ),
          numButton(0, value),
          TextButton(
            onPressed: () {
              value.addOnsInputPin();
            },
            child: const Icon(
              Icons.backspace,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
