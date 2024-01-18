import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pay_o/common/theme.dart';
import 'package:pay_o/pages/payment_history_page.dart';
import 'package:pay_o/pages/pending_payment_history_page.dart';
import 'package:pay_o/pages/profile_page.dart';
import 'package:pay_o/pages/qris_page.dart';
import 'package:provider/provider.dart';
import '../pages/dashboard_page.dart';
import '../providers/navigation_bar_provider.dart';
import 'package:toast/toast.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  DateTime currentBackPressTime = DateTime.now();
  String message = "Tekan sekali lagi untuk keluar";

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    willPop() async {
      final timaGap = DateTime.now().difference(currentBackPressTime);
      final canExit = timaGap >= const Duration(seconds: 2);
      currentBackPressTime = DateTime.now();

      if (canExit) {
        Toast.show(
          message,
          textStyle: primaryTextStyle,
          backgroundRadius: 10,
          duration: 2,
          gravity: Toast.bottom,
        );
        return false;
      } else {
        return true;
      }
    }

    body(NavigationBarProvider value) {
      switch (value.currentIndex) {
        case 0:
          return WillPopScope(
            onWillPop: willPop,
            child: const DashboardPage(),
          );
        case 1:
          return WillPopScope(
            onWillPop: willPop,
            child: const PaymentHistoryPage(),
          );
        case 2:
          return WillPopScope(
            onWillPop: willPop,
            child: const PendingPaymentHistoryPage(),
          );
        case 3:
          return WillPopScope(
            onWillPop: willPop,
            child: const ProfilePage(),
          );
      }
    }

    return Consumer<NavigationBarProvider>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: white,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Visibility(
            visible: !keyboardIsOpen,
            child: SizedBox(
              height: 65,
              width: 65,
              child: FloatingActionButton(
                elevation: 4,
                backgroundColor: secondaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const QRISPage(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                },
                child: Icon(
                  Icons.qr_code_scanner_rounded,
                  color: white,
                  size: 30,
                ),
              ),
            ),
          ),
          body: body(value),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                defaultBorderRadius,
              ),
              topLeft: Radius.circular(
                defaultBorderRadius,
              ),
            ),
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 5,
              clipBehavior: Clip.antiAlias,
              child: BottomNavigationBar(
                selectedLabelStyle: primaryTextStyle.copyWith(
                  color: primaryColor,
                ),
                unselectedLabelStyle: primaryTextStyle.copyWith(
                  color: grey500,
                  fontSize: 12,
                ),
                type: BottomNavigationBarType.fixed,
                backgroundColor: white,
                currentIndex: value.currentIndex,
                onTap: (valueIndex) {
                  value.updateCurrentIndex(valueIndex);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/svg/home.svg",
                      height: 30,
                      width: 30,
                      color: value.currentIndex == 0 ? primaryColor : grey500,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/svg/payments.svg",
                      height: 30,
                      width: 30,
                      color: value.currentIndex == 1 ? primaryColor : grey500,
                    ),
                    label: "Payments",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/svg/history.svg",
                      color: value.currentIndex == 2 ? primaryColor : grey500,
                    ),
                    label: "History",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/svg/profile.svg",
                      color: value.currentIndex == 3 ? primaryColor : grey500,
                    ),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
