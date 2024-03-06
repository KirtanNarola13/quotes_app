import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/modules/screens/fav-quote/fav-quote.dart';
import 'package:quotes_app/modules/screens/quote_page/view/quote.dart';
import 'package:quotes_app/modules/screens/splash-screen/view/splash-screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const QuoteScreen()),
        GetPage(name: '/fav', page: () => const FavQuote()),
      ],
    ),
  );
}
