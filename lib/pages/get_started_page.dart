import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.assets.dart';
import 'package:ukc_ship/config/app.font.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/widgets/appbar_custom.dart';
import 'package:ukc_ship/widgets/button_custom.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Kalkulator UKC",
        context: context,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.bgIntro,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        AppAssets.logo,
                        width: 324,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Ship\nUKC Calculator',
                      style: whiteTextStyle.copyWith(
                        fontSize: 36,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Alat andal untuk mengukur kedalaman air di bawah kapal Anda",
                      style: whiteTextStyle,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      label: 'Memulai',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.abstract);
                      },
                      isExpanded: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
