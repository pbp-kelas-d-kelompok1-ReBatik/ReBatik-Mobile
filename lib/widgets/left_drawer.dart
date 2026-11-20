import 'package:flutter/material.dart';
import 'package:rebatik_mobile/core/constants/app_assets.dart';
import 'package:rebatik_mobile/core/theme/app_colors.dart';
import 'package:rebatik_mobile/core/theme/app_fonts.dart';
import 'package:rebatik_mobile/screens/batik_custom/batik_custom_page.dart';
import 'package:rebatik_mobile/screens/batik_story/batik_story_page.dart';
import 'package:rebatik_mobile/screens/donasi/donasi_page.dart';
import 'package:rebatik_mobile/screens/menu.dart';
import 'package:rebatik_mobile/screens/upcycling/upcycling_page.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.navbarStart),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.logo, width: 36, height: 36),
                const SizedBox(height: 2),
                const Text(
                  'ReBatik',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFonts.garamond,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.navbarText,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Lestarikan batik, beri kain bekas hidup kedua.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFonts.plusJakartaSans,
                    fontSize: 10,
                    color: AppColors.navbarText,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Beranda'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ReBatikPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('Batik Story'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BatikStoryPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Batik Custom'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BatikCustomPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.volunteer_activism),
            title: const Text('Donasi'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DonasiPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.autorenew),
            title: const Text('Upcycling'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const UpcyclingPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
