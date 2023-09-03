import 'package:flutter/material.dart';
import 'package:ukc_ship/widgets/button_custom.dart';

class DoubleButton extends StatelessWidget {
  const DoubleButton({
    super.key,
    required this.route,
  });

  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              label: "Selanjutnya",
              onTap: () {
                Navigator.pushNamed(context, route);
              }),
        ],
      ),
    );
  }
}
