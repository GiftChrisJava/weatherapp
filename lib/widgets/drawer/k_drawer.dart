// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:register/pages/alerts/alertScreen.dart';
import 'package:register/pages/video_player.dart';
import 'package:register/widgets/drawer/k_drawer_item.dart';

class KDrawer extends StatelessWidget {
  const KDrawer({super.key});

  static const String email = "abc@bgc.ag";
  static const String profileName = "Don Chilcson";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF2B4A54)),
            accountName: Text(profileName),
            accountEmail: Text(email),
          ),
          Divider(),
          KDrawerItem(leadingIcon: Icons.person, title: profileName),
          KDrawerItem(
              leadingIcon: Icons.add_alert,
              title: " View Alerts",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AlertScreen()))),
          KDrawerItem(
              leadingIcon: Icons.library_books,
              title: "Learning Resources",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyVideoPlayer()))),
          KDrawerItem(leadingIcon: Icons.settings, title: "Language"),
          KDrawerItem(leadingIcon: Icons.color_lens, title: "sign out"),
        ],
      ),
    );
  }
}
