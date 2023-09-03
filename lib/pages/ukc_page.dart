import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.color.dart';
import 'package:ukc_ship/config/app.font.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/widgets/appbar_custom.dart';
import 'package:ukc_ship/widgets/double_button_custom.dart';
import 'package:ukc_ship/widgets/title_custom.dart';

class UKCPage extends StatefulWidget {
  const UKCPage({super.key});

  @override
  State<UKCPage> createState() => _UKCPageState();
}

class _UKCPageState extends State<UKCPage> {
  TextEditingController mappedDepthController = TextEditingController();
  TextEditingController tideHeightController = TextEditingController();
  TextEditingController staticDraftController = TextEditingController();

  double mappedDepth = 0.0; // Kedalaman Air yang Dipetakan
  double tideHeight = 0.0; // Ketinggian Air Pasang
  double staticDraft = 0.0; // Draf Dalam Statik
  double ukcResult = 0.0; // Hasil perhitungan UKC

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    mappedDepthController.dispose();
    tideHeightController.dispose();
    staticDraftController.dispose();
    super.dispose();
  }

  void resetValues() {
    // Reset input values and result.
    mappedDepthController.clear();
    tideHeightController.clear();
    staticDraftController.clear();
    setState(() {
      ukcResult = 0.0;
      mappedDepth = 0.0;
      tideHeight = 0.0;
      staticDraft = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(title: "Perhitungan UKC", context: context),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const CustomTitle(title: "Perhitungan UKC"),
                    Text(
                      "UKC = (Kedalaman Air yang Dipetakan + Ketinggian Air Pasang) - (Draf Dalam Statik)",
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                        color: AppColor.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: mappedDepthController,
                      decoration: const InputDecoration(
                        labelText: "Kedalaman Air yang Dipetakan (m)",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          mappedDepth = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    TextField(
                      controller: tideHeightController,
                      decoration: const InputDecoration(
                        labelText: "Ketinggian Air Pasang (m)",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          tideHeight = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    TextField(
                      controller: staticDraftController,
                      decoration: const InputDecoration(
                        labelText: "Draf Dalam Statik (m)",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          staticDraft = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 140,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              resetValues();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: Text(
                              "Reset",
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        SizedBox(
                          width: 140,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                ukcResult =
                                    mappedDepth + tideHeight - staticDraft;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.green, // Set the button color to red.
                            ),
                            child: Text(
                              "Hitung UKC",
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Hasil Perhitungan UKC:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        "${ukcResult.toStringAsFixed(2)} meter",
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    const DoubleButton(route: AppRoute.squatE)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
