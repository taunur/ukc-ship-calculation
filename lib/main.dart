import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukc_ship/config/app.color.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/pages/about_page.dart';
import 'package:ukc_ship/pages/abstract_page.dart';
import 'package:ukc_ship/pages/get_started_page.dart';
import 'package:ukc_ship/pages/ukc_explain_page.dart';
import 'package:ukc_ship/pages/ukc_page.dart';

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
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColor.backgroundScaffold,
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary,
          secondary: AppColor.secondary,
        ),
        dividerTheme: const DividerThemeData(color: Colors.white),
      ),
      home: const GetStartedPage(),
      routes: {
        AppRoute.getStarted: (context) => const GetStartedPage(),
        AppRoute.abstract: (context) => const AbstractPage(),
        AppRoute.about: (context) => const AboutPage(),
        AppRoute.ukcE: (context) => const UKCExplainPage(),
        AppRoute.ukc: (context) => const UKCPage(),
      },
    );
  }
}
