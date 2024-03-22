import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/modules/screens/fav-quote/fav-quote.dart';
import 'package:quotes_app/modules/screens/intro-screen/intro-screen.dart';
import 'package:quotes_app/modules/screens/quote_page/controller/bg_controller.dart';
import 'package:quotes_app/modules/screens/quote_page/view/quote.dart';
import 'package:quotes_app/modules/screens/splash-screen/view/splash-screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BgController bgController = Get.put(BgController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color(
          int.parse(bgController.bgModel.bgColor),
        ),
      ),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/intro', page: () => const IntroScreen()),
        GetPage(name: '/home', page: () => const QuoteScreen()),
        GetPage(name: '/fav', page: () => const FavQuote()),
      ],
    ),
  );
}
