import 'package:flutter/material.dart';
import 'package:ukc_ship/pages/home_page.dart';

void main() {
  runApp(const UkcCalculatorApp());
}

class UkcCalculatorApp extends StatelessWidget {
  const UkcCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UKC Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
