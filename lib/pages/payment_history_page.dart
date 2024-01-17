import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common/theme.dart';
import '../widgets/background_screen_widget.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white,
      body: Stack(
        children: [
          const BackgroundScreenWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...listPayments(context).reversed,
                ],
              ),
            ),
          ),
          Container(
            height: height * 0.3,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Payments",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.8,
                      child: TextField(
                        style: secondaryTextStyle,
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          hintText: "Search",
                          contentPadding: const EdgeInsets.all(10),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.grey[400],
                          ),
                          hintStyle: primaryTextStyle.copyWith(
                            color: Colors.grey[400],
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset("assets/svg/filter.svg"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentsTemplate(
    BuildContext context,
    String merchantName,
    String paymentType,
    String dateTime,
    String totalAmount,
    String paymentStatus,
  ) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: Container(
        width: double.maxFinite,
        height: height * 0.13,
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: grey400.withOpacity(0.3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.qr_code_scanner_rounded,
                  color: black,
                  size: 40,
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      merchantName,
                      style: secondaryTextStyle,
                    ),
                    Text(
                      paymentType,
                      style: secondaryTextStyle.copyWith(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      dateTime,
                      style: secondaryTextStyle.copyWith(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "-Rp$totalAmount",
                  style: secondaryTextStyle.copyWith(
                    color: Colors.red,
                  ),
                ),
                Text(
                  paymentStatus,
                  style: secondaryTextStyle.copyWith(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> listPayments(BuildContext context) {
    return [
      paymentsTemplate(
        context,
        "Bu Oneng",
        "QR Payment",
        "10 January 2024",
        "75.000",
        "Success",
      ),
      paymentsTemplate(
        context,
        "Bu Oneng",
        "QR Payment",
        "10 January 2024",
        "5.000",
        "Success",
      ),
      paymentsTemplate(
        context,
        "Bu Oneng",
        "QR Payment",
        "11 January 2024",
        "10.000",
        "Success",
      ),
      paymentsTemplate(
        context,
        "Bu Oneng",
        "QR Payment",
        "11 January 2024",
        "1.000",
        "Success",
      ),
      paymentsTemplate(
        context,
        "Bu Oneng",
        "QR Payment",
        "11 January 2024",
        "6.500",
        "Success",
      ),
      paymentsTemplate(
        context,
        "Warung AA",
        "QR Payment",
        "12 January 2024",
        "11.000",
        "Success",
      ),
    ];
  }
}
