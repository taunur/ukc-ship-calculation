import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.font.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/lists/abstract_list.dart';
import 'package:ukc_ship/widgets/appbar_custom.dart';
import 'package:ukc_ship/widgets/double_button_custom.dart';
import 'package:ukc_ship/widgets/title_custom.dart';

class AbstractPage extends StatelessWidget {
  const AbstractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Abstrak", context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const CustomTitle(
                title: "Abstrak",
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: abstracts.length,
                itemBuilder: (context, index) {
                  final abstract = abstracts[index];
                  final desc = abstract['desc'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textNormal(desc),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              ),
              const DoubleButton(
                route: AppRoute.about,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text textNormal(String textNormal) {
    return Text(
      textNormal,
      style: blackTextStyle,
      textAlign: TextAlign.justify,
    );
  }
}
