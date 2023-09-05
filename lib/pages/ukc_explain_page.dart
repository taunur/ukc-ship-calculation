import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.color.dart';
import 'package:ukc_ship/config/app.font.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/lists/ukc_explain_list.dart';
import 'package:ukc_ship/widgets/appbar_custom.dart';
import 'package:ukc_ship/widgets/double_button_custom.dart';
import 'package:ukc_ship/widgets/title_custom.dart';

class UKCExplainPage extends StatelessWidget {
  const UKCExplainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Menghitung UKC", context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Center(
                child: CustomTitle(
                  title: "Menghitung UKC",
                ),
              ),
              for (final section in ukcExplain)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (section['title'].isNotEmpty)
                      Text(
                        section['title'],
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    Text(
                      section['desc'],
                      style: blackTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                    if (section['items'].isNotEmpty) const SizedBox(height: 8),
                    if (section['items'].isNotEmpty) listTile(section['items']),
                    const SizedBox(height: 8),
                  ],
                ),
              const DoubleButton(
                route: AppRoute.ukc,
              ),
            ],
          ),
        ),
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
