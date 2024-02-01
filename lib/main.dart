import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/modules/screens/quote_page/view/quote.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.white,
      ),
      getPages: [
        GetPage(name: '/', page: () => const QuoteScreen()),
      ],
    ),
  );
}
