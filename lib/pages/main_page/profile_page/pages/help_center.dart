

import 'package:alertamigo_app/pages/main_page/profile_page/pages/report_problem_page.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../widget/app_back_button.dart';
import '../../../../widget/app_tile.dart';
import 'feature_request_page.dart';

class HelpCentrePage extends StatelessWidget {
  static const routeName = "help-center-page";
  const HelpCentrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const AppBackButton(),
        title: const Text("Help Centre"),
      ),
      body: Column(
        children: [
          AppTile(
            title: "Contact Us",
            onTap: () {},
            icon: Icons.arrow_forward_ios_rounded,
          ),
          Constants.getDivider(),
          AppTile(
            title: "Report a problem",
            onTap: () {
              Navigator.of(context).pushNamed(ReportProblemPage.routeName);
            },
            icon: Icons.arrow_forward_ios_rounded,
          ),
          Constants.getDivider(),
          AppTile(
            title: "Feature request",
            onTap: () {
              Navigator.of(context).pushNamed(FeatureRequestPage.routeName);

            },
            icon: Icons.arrow_forward_ios_rounded,
          ),

        ],
      ),
    );
  }
}


