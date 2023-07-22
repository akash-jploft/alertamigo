import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/location_sharing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationShareModal extends StatefulWidget {
  const LocationShareModal({super.key});

  @override
  State<LocationShareModal> createState() => _LocationShareModalState();
}

class _LocationShareModalState extends State<LocationShareModal> {
  bool toggleValue = true;

  @override
  Widget build(BuildContext context) {

    buildTitle({
      required String title,
      required VoidCallback onTap,
      required String icon,
    }) {
      return InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, bottom: 18),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                height: 28,
                icon,
                //    color: iconColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    buildHideLocationTile() {
      return Padding(
        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
        child: Row(
          children: [
            Image.asset(
              toggleValue   ?    "assets/icon/eye-off.png":     "assets/icon/eye.png",
              height: 28,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Hide location",
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            CupertinoSwitch(
              value: toggleValue,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() {
                    toggleValue = value;
                  });
                }
              },
            ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
      );
    }

    return Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child:

            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  const SizedBox(
                    height: 30,
                  ),
                  buildTitle(
                      title: "Copy address",
                      onTap: () {
                        Navigator.of(context).pop();
                        Constants.getToast(
                          msg: "Address Copied",
                        );
                      },
                      icon: "assets/icon/copy.png"),
                  Constants.getDivider(),
                  buildHideLocationTile(),
                  Constants.getDivider(),
                  buildTitle(
                    title: "Manage location sharing",
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(LocationSharingPage.routeName);
                    },
                    icon: "assets/icon/location.png",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ]),


         );
  }
}
