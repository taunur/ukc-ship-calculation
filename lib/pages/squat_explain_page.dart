import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.font.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/widgets/appbar_custom.dart';
import 'package:ukc_ship/widgets/double_button_custom.dart';
import 'package:ukc_ship/widgets/title_custom.dart';

class SquatExplainPage extends StatelessWidget {
  const SquatExplainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Squat", context: context),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Center(
                    child: CustomTitle(
                      title: "Squat",
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Efek squat adalah fenomena hidrodinamika di mana kapal yang bergerak cepat melalui perairan dangkal menciptakan area dengan tekanan rendah yang menyebabkan kapal lebih dekat ke dasar laut daripada yang diharapkan. Efek squat kira-kira sebanding dengan kuadrat kecepatan kapal.",
                      style: blackTextStyle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Image.asset(
                    "assets/img_squat.png",
                    width: double.infinity,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      "Efek squat di perairan dangkal",
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const DoubleButton(
                    route: AppRoute.squatInteraction,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
