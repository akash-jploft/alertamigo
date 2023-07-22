

import 'package:alertamigo_app/widget/app_back_button.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../widget/app_tile.dart';

class AboutPage extends StatelessWidget {
  static const routeName = "about-page";
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const AppBackButton(),
        title: const Text("About"),
      ),
      body: Column(
        children: [
          AppTile(
            title: "Privacy Policy",
            onTap: () {},
            icon: Icons.arrow_forward_ios_rounded,
          ),
          Constants.getDivider(),
          AppTile(
            title: "Terms and conditions",
            onTap: () {},
            icon: Icons.arrow_forward_ios_rounded,
          ),

          Constants.getDivider(),
          AppTile(
            title: "Community Guidelines",
            onTap: () {},
            icon: Icons.arrow_forward_ios_rounded,
          ),


          const Spacer(),
          Image.asset("assets/app_icon.jpg",height: 50,),
          const SizedBox(height: 10,),
          const Text("Version 12.2.4",style: TextStyle(
            fontWeight: FontWeight.w400,


          ),),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
