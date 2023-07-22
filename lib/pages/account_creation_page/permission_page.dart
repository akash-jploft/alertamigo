import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/app_back_button.dart';
import '../../widget/app_button.dart';
import '../main_page/main_page.dart';

class PermissionsPage extends StatelessWidget {
  static const routeName = "permission-page";

  const PermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    buildPermissionsCard(
        {required String title,
        required String subtitle,
        required IconData icon}) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor.withOpacity(.5),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 16, letterSpacing: 1.5, color: Colors.black54),
                )
              ],
            ),
          )
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
          //    resizeToAvoidBottomInset: false,
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const AppBackButton(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Permissions",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    buildPermissionsCard(
                        icon: Icons.mic,
                        title: "Microphone access",
                        subtitle:
                            "Enable microphone access so you can record audio evidence for incident reports."),
                    const SizedBox(
                      height: 20,
                    ),
                    buildPermissionsCard(
                        title: "Location access",
                        subtitle:
                            "Your location will be shared with your emergency contacts if SOS mode is activated or you enable location sharing with selected contacts",
                        icon: Icons.location_on_rounded),
                    const SizedBox(
                      height: 20,
                    ),
                    buildPermissionsCard(
                        title: "Notification",
                        subtitle:
                            "Don't miss important notifications about safety and your emergency contacts.",
                        icon: Icons.message_outlined),
                    const Spacer(),
                    AppButton(
                        bgColor: Theme.of(context).primaryColor,
                        fgColor: Colors.white,
                        onTap: () async {
                          bool? microPhoneRes = await showCupertinoDialog(
                              context: context,
                              builder: (builder) {
                                return showAppDialog(
                                    title:
                                        "\"Alertamigo\" Would Like To Access The Microphone",
                                    description:
                                        "Allow microphone access so you can record audio evidence for your incident reports.",
                                    action: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, false);
                                          },
                                          child: const Text("Don't Allow")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, true);
                                          },
                                          child: const Text("OK")),
                                    ]);
                              });
                          if (microPhoneRes == true) {
                            bool? locationRes = await showCupertinoDialog(
                                context: context,
                                builder: (builder) {
                                  return showAppDialog(
                                      title:
                                          "Allow \"Alertamigo\" To use your Location?",
                                      description:
                                          "Your precise location is shared with your emergency contacts in the case of an emergency.",
                                      action: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, false);
                                            },
                                            child: const Text("Don't Allow")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, true);
                                            },
                                            child: const Text("OK")),
                                      ]);
                                });

                            if (locationRes == true) {
                              bool? notificationRes = await showCupertinoDialog(
                                  context: context,
                                  builder: (builder) {
                                    return showAppDialog(
                                        title:
                                            "\"Alertamigo\" Would like to send you Notifications",
                                        description:
                                            "Notifications may include alerts, sounds and icon badges. These can be configured in Settings.",
                                        action: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context, false);
                                              },
                                              child: const Text("Don't Allow")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context, true);
                                              },
                                              child: const Text("OK")),
                                        ]);
                                  });

                              if (notificationRes == true) {
                                Navigator.of(context)
                                    .pushReplacementNamed(MainPage.routeName, arguments: 0);
                              }
                            }
                          }
                        },
                        title: "Continue"),
                    const SizedBox(
                      height: 20,
                    )
                  ]))),
    );
  }

  showAppDialog(
      {required String title,
      required String description,
      required List<Widget> action}) {
    return CupertinoAlertDialog(
      title: Text(
        title,
      ),
      content: Text(description),
      actions: action,
    );
  }
}
