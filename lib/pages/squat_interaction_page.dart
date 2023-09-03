import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.color.dart';
import 'package:ukc_ship/config/app.font.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/lists/squat_interaction.dart';
import 'package:ukc_ship/widgets/appbar_custom.dart';
import 'package:ukc_ship/widgets/double_button_custom.dart';
import 'package:ukc_ship/widgets/title_custom.dart';

class SquatInteractionPage extends StatelessWidget {
  const SquatInteractionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Squat dan Interaksi", context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Center(
                child: CustomTitle(
                  title: "Squat dan Interaksi",
                ),
              ),
              Text(
                "Faktor-faktor spesifik berikut ini harus dipertimbangkan selama perencanaan pelayaran dan dicatat sebelum melanjutkan perjalanan :",
                style: blackTextStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: squatInteractions.length,
                itemBuilder: (BuildContext ctx, int index) {
                  final squatInteraction = squatInteractions[index];
                  final title = squatInteraction['title'];
                  final desc = squatInteraction['desc'];
                  final items = squatInteraction['items'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title.isEmpty
                          ? const SizedBox()
                          : Text(
                              title,
                              style: blackTextStyle.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                      Text(
                        desc,
                        style: blackTextStyle,
                        textAlign: TextAlign.justify,
                      ),
                      if (items != null && items.isNotEmpty)
                        const SizedBox(height: 8),
                      if (items != null && items.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: items
                              .map<Widget>((item) => Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          item,
                                          style: blackTextStyle.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              ),
              const DoubleButton(
                route: AppRoute.squat,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
