import 'package:flutter/material.dart';
import 'package:ukc_ship/config/app.color.dart';
import 'package:ukc_ship/config/app.routes.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext context;

  const CustomAppbar({
    super.key,
    required this.title,
    required this.context,
  });

  Widget buildPopupMenuButton() {
    return PopupMenuButton<String>(
      padding: const EdgeInsets.all(0),
      icon: const Icon(
        Icons.more_vert,
        color: AppColor.white,
      ),
      color: AppColor.primary,
      offset: const Offset(0, 50),
      onSelected: (value) {
        switch (value) {
          case 'home':
            Navigator.pushReplacementNamed(context, AppRoute.getStarted);
            break;
          case 'abstract':
            Navigator.pushNamed(context, AppRoute.abstract);
            break;
          case 'about':
            Navigator.pushNamed(context, AppRoute.about);
            break;
          case 'ukcE':
            Navigator.pushNamed(context, AppRoute.ukcE);
            break;
          case 'ukc':
            Navigator.pushNamed(context, AppRoute.ukc);
            break;
          case 'squatE':
            Navigator.pushNamed(context, AppRoute.squatE);
            break;
          case 'squatInteraction':
            Navigator.pushNamed(context, AppRoute.squatInteraction);
            break;
          case 'squat':
            Navigator.pushNamed(context, AppRoute.squat);
            break;
        }
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'home',
          child: Text(
            'Beranda',
            style: TextStyle(color: AppColor.white),
          ),
        ),
        const PopupMenuDivider(height: 0),
        const PopupMenuItem<String>(
          value: 'abstract',
          child: Text(
            'Abstrak',
            style: TextStyle(color: AppColor.white),
          ),
        ),
        const PopupMenuDivider(height: 0),
        const PopupMenuItem<String>(
          value: 'about',
          child: Text(
            'Tentang UKC',
            style: TextStyle(color: AppColor.white),
          ),
        ),
        const PopupMenuDivider(height: 0),
        const PopupMenuItem<String>(
          value: 'ukcE',
          child: Text(
            'Menghitung UKC',
            style: TextStyle(color: AppColor.white),
          ),
        ),
        const PopupMenuDivider(height: 0),
        const PopupMenuItem<String>(
          value: 'ukc',
          child: Text(
            'Perhitungan UKC',
            style: TextStyle(color: AppColor.white),
          ),
        ),
        const PopupMenuDivider(height: 0),
        const PopupMenuItem<String>(
          value: 'squatE',
          child: Text(
            'Efek Squat',
            style: TextStyle(color: AppColor.white),
          ),
        ),
        const PopupMenuDivider(height: 0),
        const PopupMenuItem<String>(
          value: 'squatInteraction',
          child: Text(
            'Interaksi Squat',
            style: TextStyle(color: AppColor.white),
          ),
        ),
        const PopupMenuDivider(height: 0),
        const PopupMenuItem<String>(
          value: 'squat',
          child: Text(
            'Perhitungan Squat',
            style: TextStyle(color: AppColor.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/logo_poltekpel.png",
                width: 28,
              ),
              const SizedBox(width: 12),
              Text(title),
            ],
          ),
          buildPopupMenuButton(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
