import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widget/app_back_button.dart';
import '../../../../widget/app_button.dart';
import '../../../sign_up_page/mobile_input_page.dart';

class DeleteAccountPage extends StatefulWidget {
  static const routeName = "delete-account-page";

  const DeleteAccountPage({Key? key}) : super(key: key);

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const AppBackButton(),
        title:const Text("Deleting account"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const SizedBox(height: 12,),
            const TextField(
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "Reason for deleting...",
              ),
            ),
            const Spacer(),
            AppButton(
                bgColor: Theme.of(context).primaryColor,
                fgColor: Colors.white,
                onTap: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text("Delete account?"),
                          content: const Text(
                              "If you delete your account, you will permanently lose your profile and posts. This action cannot be undone."),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(MobileInputPage.routeName);
                                },
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                )),
                          ],
                        );
                      });
                },
                title: "Send"),
            const SizedBox(
              height: 12,
            ),
            AppButton(
                bgColor: Theme.of(context).disabledColor,
                fgColor: Theme.of(context).primaryColor,
                onTap: () {},
                title: "Skip"),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
