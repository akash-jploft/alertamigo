import 'package:alertamigo_app/pages/main_page/profile_page/pages/enter_new_mobile_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/new_email_address_page.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../widget/app_back_button.dart';
import '../../../../widget/app_tile.dart';
import 'delete_account_page.dart';
import 'location_sharing_page.dart';

class AccountSettingsPage extends StatelessWidget {
  static const routeName = "account-settings-page";

  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const AppBackButton(),
        title: const Text("Account settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppTile(
              title: "Location sharing",
              onTap: () {
                Navigator.of(context).pushNamed(LocationSharingPage.routeName);
              },
              icon: Icons.arrow_forward_ios_rounded,
            ),
            Constants.getDivider(),
            AppTile(
              title: "Email address",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return  const NewEmailInputPage();
                }));
              },
              icon: Icons.arrow_forward_ios_rounded,
            ),
            Constants.getDivider(),
            AppTile(
              title: "Mobile number",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                  return  const NewMobilePage();
                }));
              },
              icon: Icons.arrow_forward_ios_rounded,
            ),
            Constants.getDivider(),
            const SizedBox(
              height: 36,
            ),
            AppTile(
              title: "Logout",
              onTap: () {},
              icon: Icons.arrow_forward_ios_rounded,
            ),
            Constants.getDivider(),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(DeleteAccountPage.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Text(
                          "Delete account",
                          style: TextStyle(fontSize: 18, color: Colors.red.shade400,fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 2.0),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey.withOpacity(.8),
                            size: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
            Constants.getDivider(),
          ],
        ),
      ),
    );
  }
}

