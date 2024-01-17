import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_o/pages/onboarding_page.dart';
import 'package:pay_o/providers/auth_provider.dart';
import 'package:pay_o/providers/navigation_bar_provider.dart';
import 'package:pay_o/providers/pending_payment_history_provider.dart';
import 'package:provider/provider.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const PayO());
}

class PayO extends StatefulWidget {
  const PayO({super.key});

  @override
  State<PayO> createState() => _PayOState();
}

class _PayOState extends State<PayO> {
@override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PendingPaymentHistoryProvider(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: OnBoardingPage(),
          );
        },
      ),
    );
  }
}
