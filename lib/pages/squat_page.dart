import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.color.dart';
import 'package:ukc_ship/config/app.font.dart';
import 'package:ukc_ship/config/app.routes.dart';
import 'package:ukc_ship/widgets/appbar_custom.dart';
import 'package:ukc_ship/widgets/button_custom.dart';
import 'package:ukc_ship/widgets/title_custom.dart';

class SquatPage extends StatefulWidget {
  const SquatPage({super.key});

  @override
  State<SquatPage> createState() => _SquatPageState();
}

class _SquatPageState extends State<SquatPage> {
  TextEditingController blockCoefficientController = TextEditingController();
  TextEditingController shipSpeedController = TextEditingController();
  FocusNode blockCoefficientFocus = FocusNode();
  FocusNode shipSpeedFocus = FocusNode();

  double blockCoefficient = 0.0;
  double shipSpeed = 0.0;
  double squatResult = 0.0;

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    blockCoefficientController.dispose();
    shipSpeedController.dispose();
    super.dispose();
  }

  void resetValues() {
    // Reset input values and result.
    blockCoefficientController.clear();
    shipSpeedController.clear();
    setState(() {
      squatResult = 0.0;
      blockCoefficient = 0.0;
      shipSpeed = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(title: "Perhitungan Squat", context: context),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const CustomTitle(title: "Perhitungan Squat"),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Squat = ',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.primary,
                              fontWeight: semiBold,
                            ),
                          ),
                          TextSpan(
                            text: '(2',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.primary,
                              fontWeight: semiBold,
                            ),
                          ),
                          TextSpan(
                            text: ' * CB) * V',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.primary,
                              fontWeight: semiBold,
                            ),
                          ),
                          TextSpan(
                            text: '²',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.primary,
                              fontWeight: semiBold,
                            ),
                          ),
                          TextSpan(
                            text: ' / 100',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.primary,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      focusNode: blockCoefficientFocus,
                      controller: blockCoefficientController,
                      decoration: const InputDecoration(
                        labelText: "Koefisien blok kapal (Cb)",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          blockCoefficient = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    TextField(
                      controller: shipSpeedController,
                      focusNode: shipSpeedFocus,
                      decoration: const InputDecoration(
                        labelText: "Kecepatan kapal (V)",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          shipSpeed = double.tryParse(value) ?? 0.0;
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
                              if (blockCoefficientController.text.isEmpty ||
                                  shipSpeedController.text.isEmpty) {
                                // Tampilkan pesan kesalahan jika salah satu input kosong.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Mohon isi kedua input terlebih dahulu."),
                                  ),
                                );
                              } else {
                                // Menutup keyboard dengan memanggil unfocus pada FocusNode.
                                blockCoefficientFocus.unfocus();
                                shipSpeedFocus.unfocus();

                                // Hitung squatResult jika kedua input telah diisi.
                                setState(() {
                                  squatResult = (2 * blockCoefficient) *
                                      shipSpeed *
                                      shipSpeed /
                                      100;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: Text(
                              "Hitung Squat",
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
                        "${squatResult.toStringAsFixed(2)} meter",
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                              label: "Kembali",
                              onTap: () {
                                Navigator.pop(context);
                              }),
                          CustomButton(
                              label: "Beranda",
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRoute.getStarted,
                                  (Route<dynamic> route) => false,
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
