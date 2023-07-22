import 'package:alertamigo_app/pages/main_page/profile_page/pages/about_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/account_settings_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/edit_profile_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/help_center.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/premium_modal.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../widget/app_tile.dart';
import '../alerts_page/pages/incident_posts_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    buildAvatar() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          SizedBox(
            height: 100,
            width: 100,
            child: ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Sarah Log",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return const PremiumModal();
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Basic Account",
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontWeight: FontWeight.w500,
                      fontSize: 15),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).secondaryHeaderColor,
                      size: 20,
                    ),
                  ],
                ),
              ))
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            buildAvatar(),
            const SizedBox(
              height: 40,
            ),
            AppTile(
              title: "Edit profile",
              onTap: () {
                Navigator.of(context).pushNamed(EditProfilePage.routeName);
              },
              icon: Icons.keyboard_arrow_right_rounded,
            ),
            Constants.getDivider(),
            AppTile(
              title: "Incident posts",
              onTap: () =>
                  Navigator.of(context).pushNamed(IncidentPostsPage.routeName),
              icon: Icons.keyboard_arrow_right_rounded,
            ),
            Constants.getDivider(),
            AppTile(
              title: "Account settings",
              onTap: () {
                Navigator.of(context).pushNamed(AccountSettingsPage.routeName);
              },
              icon: Icons.keyboard_arrow_right_rounded,
            ),
            Constants.getDivider(),
            AppTile(
              title: "Help centre",
              onTap: () {
                Navigator.of(context).pushNamed(HelpCentrePage.routeName);
              },
              icon: Icons.keyboard_arrow_right_rounded,
            ),
            Constants.getDivider(),
            AppTile(
              title: "About",
              onTap: () {
                Navigator.of(context).pushNamed(AboutPage.routeName);
              },
              icon: Icons.keyboard_arrow_right_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
