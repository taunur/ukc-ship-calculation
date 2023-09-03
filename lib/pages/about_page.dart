import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.color.dart';
import 'package:ukc_ship/config/app.font.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/widgets/appbar_custom.dart';
import 'package:ukc_ship/widgets/double_button_custom.dart';
import 'package:ukc_ship/widgets/title_custom.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listUKC = [
      "Vessel's trim and list characteristic",
      "Depth of the transit area",
      "Depth at the facility or anchorage",
      "Tide and current conditions",
      "Weather impact on water depth"
    ];

    List<String> listCalculating = [
      "Pengamatan/perhitungan draft termasuk perkiraan hogging dan sagging",
      "Peningkatan draft karena gerakan naik, pitching, dan rolling",
    ];

    List<String> listSquat = [
      "Peningkatan draf karena perubahan densitas air - Kedalaman minimum yang dipetakan yang tersedia Ketinggian pasang yang diprediksi (minimum yang tersedia selama jendela transit yang direncanakan)",
      "Keadaan laut dan gelombang",
    ];

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
                'UNDER-KEEL CLEARANCE (UKC): ',
                'berarti jarak bebas minimum yang tersedia antara titik terdalam pada kapal dan dasar di air tenang. Nakhoda dan pilot harus menggunakan draft terdalam kapal mereka di air tenang saat menghitung UKC. Mereka harus menerapkan kelonggaran plus atau minus untuk air pasang ketika menghitung kedalaman air, dan mempertimbangkan faktor-faktor berikut ini:',
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listUKC.length,
                itemBuilder: (BuildContext ctx, int index) {
                  final itemIndex = index + 1;
                  return Row(
                    children: [
                      Text("$itemIndex. "),
                      Text(
                        listUKC[index],
                        style: blackTextStyle,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 8),
              richText(
                'Menghitung UKC:',
                ' Saat menghitung UKC, faktor-faktor spesifik harus diperhitungkan selama perencanaan pelayaran dan dicatat sebelum melanjutkan perjalanan.',
              ),
              const SizedBox(height: 8),
              listTile(listCalculating),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Efek-efek dari gerakan jongkok:",
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              listTile(listSquat),
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
