import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:pay_o/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import '../widgets/background_screen_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  MidtransSDK? _midtrans;

  void initSDK() async {
    _midtrans = await MidtransSDK.init(
      config: MidtransConfig(
        clientKey: "SB-Mid-client-ZpOJ6YMYEOs17JwQ",
        merchantBaseUrl: "",
        colorTheme: ColorTheme(
          colorPrimary: Theme.of(context).colorScheme.secondary,
          colorPrimaryDark: Theme.of(context).colorScheme.secondary,
          colorSecondary: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
    _midtrans?.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
    );
    _midtrans!.setTransactionFinishedCallback((result) {
      // print(result.toJson());
    });
  }

  @override
  void initState() {
    super.initState();
    // initSDK();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      body: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return Stack(
            children: [
              const BackgroundScreenWidget(),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: defaultPadding,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "Krisna Purnama",
                                overflow: TextOverflow.ellipsis,
                                style: primaryTextStyle.copyWith(
                                  fontWeight: regular,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Get Reward",
                                    style: primaryTextStyle.copyWith(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  backgroundColor: white,
                                  child: const Icon(
                                    Icons.notifications,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Container(
                          padding: EdgeInsets.all(defaultPadding),
                          height: height * 0.15,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
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
                              SizedBox(
                                width: width * 0.6,
                                child: FlutterCarousel(
                                  options: CarouselOptions(
                                    scrollDirection: Axis.vertical,
                                    showIndicator: false,
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 10),
                                    pauseAutoPlayOnTouch: true,
                                    autoPlayAnimationDuration:
                                        const Duration(seconds: 1),
                                  ),
                                  items: [
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.cloud_rounded,
                                                color: primaryColor,
                                                size: 40,
                                              ),
                                            ],
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Use offline payment",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: secondaryTextStyle
                                                      .copyWith(fontSize: 18),
                                                ),
                                                Text(
                                                  "Wherever you are",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: secondaryTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: width * 0.6,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.qr_code_scanner_rounded,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Offline QRIS",
                                              style: primaryTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                        color: grey400,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: SvgPicture.asset(
                                            "assets/svg/send-dollar.svg"),
                                      ),
                                      Text(
                                        "Send",
                                        style: secondaryTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        SizedBox(
                          height: height * 0.3,
                          width: double.maxFinite,
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            mainAxisSpacing: defaultPadding,
                            crossAxisSpacing: defaultPadding,
                            childAspectRatio: 0.8,
                            children: payOService(context),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today's promotions",
                              style: secondaryTextStyle,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "View all",
                                style: primaryTextStyle.copyWith(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.2,
                          width: double.maxFinite,
                          child: FlutterCarousel(
                            items: promotionsList(context),
                            options: CarouselOptions(
                              showIndicator: false,
                              floatingIndicator: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 10),
                              pauseAutoPlayOnTouch: true,
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 1),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.35,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(defaultPadding),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Nearby Merchant",
                                      style: primaryTextStyle,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        "View all",
                                        style: primaryTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: defaultPadding,
                                    ),
                                    ...listNearbyMerchant(context),
                                  ],
                                ),
                              ),
                            ],
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
            ],
          );
        },
      ),
    );
  }

  Widget payOServiceTemplate(
    BuildContext context,
    Widget icon,
    String title,
  ) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Tooltip(
      message: title,
      child: Container(
        height: height * 0.1,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: grey400.withOpacity(0.3),
            ),
          ],
        ),
        child: GestureDetector(
          child: Column(
            children: [
              icon,
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: secondaryTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> payOService(BuildContext context) {
    return [
      payOServiceTemplate(
        context,
        SvgPicture.asset("assets/svg/electricity.svg"),
        "Elctricity",
      ),
      payOServiceTemplate(
        context,
        SvgPicture.asset("assets/svg/water-bill.svg"),
        "Water Bill",
      ),
      payOServiceTemplate(
        context,
        SvgPicture.asset("assets/svg/phone.svg"),
        "Phone Credit",
      ),
      payOServiceTemplate(
        context,
        SvgPicture.asset("assets/svg/internet.svg"),
        "Internet",
      ),
      payOServiceTemplate(
        context,
        SvgPicture.asset("assets/svg/e-money.svg"),
        "E-money",
      ),
      payOServiceTemplate(
        context,
        SvgPicture.asset("assets/svg/g-play.svg"),
        "G-Voucher",
      ),
      payOServiceTemplate(
        context,
        SvgPicture.asset("assets/svg/netflix.svg"),
        "Netflix",
      ),
      payOServiceTemplate(
        context,
        Icon(
          Icons.dashboard_customize_rounded,
          color: primaryColor,
          size: 35,
        ),
        "Others",
      ),
    ];
  }

  List<Widget> promotionsList(BuildContext context) {
    return [
      Image.asset(
        "assets/png/promotion.png",
        filterQuality: FilterQuality.high,
      ),
      Image.asset(
        "assets/png/promotion.png",
        filterQuality: FilterQuality.high,
      ),
      Image.asset(
        "assets/png/promotion.png",
        filterQuality: FilterQuality.high,
      ),
    ];
  }

  Widget nearbyMerchantTemplate(
    BuildContext context,
    Widget merchantLogo,
    String merchantName,
    String merchantCategory,
    String distance,
    String rate,
  ) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(right: defaultPadding),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height * 0.2,
        width: width * 0.3,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: merchantLogo,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  distance,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        rate,
                        style: secondaryTextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Text(
              merchantName,
              overflow: TextOverflow.ellipsis,
              style: secondaryTextStyle,
            ),
            Text(
              merchantCategory,
              overflow: TextOverflow.ellipsis,
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> listNearbyMerchant(BuildContext context) {
    return [
      nearbyMerchantTemplate(
        context,
        Image.asset("assets/png/kfc.png"),
        "Kentucky Fried Chicken",
        "Fast Food",
        "1.2",
        "4.8",
      ),
      nearbyMerchantTemplate(
        context,
        Image.asset("assets/png/burger-king.png"),
        "Burger King",
        "Fast Food",
        "2.6",
        "4.7",
      ),
      nearbyMerchantTemplate(
        context,
        Image.asset("assets/png/pizza-hut.png"),
        "Pizza Hut",
        "Fast Food",
        "1.7",
        "4.8",
      ),
      nearbyMerchantTemplate(
        context,
        Image.asset(
          "assets/png/mcdonalds.png",
          height: 48,
          width: 48,
        ),
        "McDonalds",
        "Fast Food",
        "1.5",
        "4.5",
      ),
    ];
  }
}
