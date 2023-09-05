import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.color.dart';
import 'package:ukc_ship/config/app.font.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/lists/about_list.dart';
import 'package:ukc_ship/widgets/appbar_custom.dart';
import 'package:ukc_ship/widgets/double_button_custom.dart';
import 'package:ukc_ship/widgets/title_custom.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Tentang UKC", context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Center(
                child: CustomTitle(
                  title: "Tentang UKC",
                ),
              ),
              richText(
                aboutUkc[0]['title'],
                aboutUkc[0]['desc'],
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: aboutUkc[0]['items'].length,
                itemBuilder: (BuildContext ctx, int index) {
                  final itemIndex = index + 1;
                  return Row(
                    children: [
                      Text("$itemIndex. "),
                      Text(
                        aboutUkc[0]['items'][index],
                        style: blackTextStyle,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 8),
              richText(
                aboutUkc[1]['title'],
                aboutUkc[1]['desc'],
              ),
              const SizedBox(height: 8),
              listTile(aboutUkc[1]['items']),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  aboutUkc[2]['title'],
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              listTile(aboutUkc[2]['items']),
              const SizedBox(height: 8),
              Image.asset(
                "assets/img_ukc.png",
                width: double.infinity,
              ),
              const SizedBox(height: 8),
              Text(
                "Underkeel Clearance (UKC)",
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 16,
                ),
              ),
              const DoubleButton(
                route: AppRoute.ukcE,
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText richText(String textBold, String textNormal) {
    return RichText(
      softWrap: true,
      textAlign: TextAlign.justify,
      text: TextSpan(
        text: textBold,
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          decoration: TextDecoration.underline,
        ),
        children: <TextSpan>[
          TextSpan(
            text: textNormal,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }

  ListView listTile(List<String> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Icon(
                Icons.circle,
                size: 8,
                color: AppColor.black,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                list[index],
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
