import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../common/theme.dart';
import '../providers/pending_payment_history_provider.dart';
import '../widgets/background_screen_widget.dart';
import 'package:provider/provider.dart';

class PendingPaymentHistoryPage extends StatefulWidget {
  const PendingPaymentHistoryPage({super.key});

  @override
  State<PendingPaymentHistoryPage> createState() =>
      _PendingPaymentHistoryPageState();
}

class _PendingPaymentHistoryPageState extends State<PendingPaymentHistoryPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<PendingPaymentHistoryProvider>(
      builder: (context, value, child) {
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
                      Visibility(
                        visible: value.isDismiss == false,
                        child: dismissibleOfflineAlert(
                          context,
                          value,
                        ),
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
                      "Pending Payments History",
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
      },
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
                    color: Colors.red,
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
        "Pending",
      ),
      paymentsTemplate(
        context,
        "Bu Oneng",
        "QR Payment",
        "10 January 2024",
        "5.000",
        "Pending",
      ),
      paymentsTemplate(
        context,
        "Bu Oneng",
        "QR Payment",
        "11 January 2024",
        "10.000",
        "Pending",
      ),
      paymentsTemplate(
        context,
        "Bu Oneng",
        "QR Payment",
        "11 January 2024",
        "1.000",
        "Pending",
      ),
      paymentsTemplate(
        context,
        "Bu Oneng",
        "QR Payment",
        "11 January 2024",
        "6.500",
        "Pending",
      ),
      paymentsTemplate(
        context,
        "Warung AA",
        "QR Payment",
        "12 January 2024",
        "11.000",
        "Pending",
      ),
    ];
  }

  Widget dismissibleOfflineAlert(
    BuildContext context,
    PendingPaymentHistoryProvider value,
  ) {
    String message = "Anda hanya dapat melihat transaksi offline anda, ketika anda kembali online, anda dapat melihat riwayat transaksi anda";
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        height: height * 0.2,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Peringatan",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    value.updateDismiss(true);
                  },
                  child: SvgPicture.asset("assets/svg/cancel.svg"),
                ),
              ],
            ),
            Text(
              message,
              textAlign: TextAlign.start,
              style: primaryTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
