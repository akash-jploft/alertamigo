import 'package:alertamigo_app/widget/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/app_back_button.dart';
import '../account_creation_page/account_creation_name_page.dart';

class FaceIdPage extends StatelessWidget {
  static const routeName = "face-id-page";

  const FaceIdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          leading: const AppBackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Image.asset("assets/icon/face_id.jpeg"),
              const SizedBox(
                height: 30,
              ),
              Text("Face ID?", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Use Face ID instead of typing \nyour passcode to unlock Alertamigo.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  letterSpacing: 1,fontSize: 17
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              AppButton(
                  bgColor: Theme.of(context).primaryColor,
                  fgColor: Colors.white,
                  onTap: () async {
                    bool? res = await showCupertinoDialog(
                        context: context,
                        builder: (builder) {
                          return CupertinoAlertDialog(
                            title: const Text(
                              "Do you Want To Allow \"Alertamigo\" To Use Face ID?",
                            ),
                            content: const Text("Use Face ID to unlock Alertamigo quickly and securely"),

                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: const Text("Dont't Allow")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: const Text("OK")),
                            ],
                          );
                        });
                    if (res == true) {
                      Navigator.of(context)
                          .pushNamed(AccountCreationNamePage.routeName);
                    }
                  },
                  title: "Continue"),
              const SizedBox(
                height: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
