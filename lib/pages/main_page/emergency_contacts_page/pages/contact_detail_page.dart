import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/model/contact_model.dart';
import 'package:alertamigo_app/pages/main_page/main_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/location_sharing_page.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../home_page/widget/call_person.dart';

class ContactDetailPage extends StatefulWidget {
  static const routeName = "contact-detail-page";
  final ContactModel contact;

  const ContactDetailPage({super.key, required this.contact});

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  bool isPhoneSelected = false;
  bool isMapSelected = false;

  @override
  Widget build(BuildContext context) {
    buildDivider() {
      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Constants.getDivider(),
      );
    }

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                SizedBox(
                    height: 40,
                    width: 40,
                    child: ClipOval(
                      child: Image.network(
                        widget.contact.imgSrc,
                        fit: BoxFit.cover,
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.contact.name,
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.contact.distance,
                      style: TextStyle(
                          fontSize: 12, color: Theme.of(context).primaryColor),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Spacer(
                  flex: 3,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showCallPersonModal(context: context);
                        setState(() {
                          isPhoneSelected = !isPhoneSelected;
                          isMapSelected = false;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: isPhoneSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade200,
                        radius: 25,
                        child: InkWell(

                          child: Icon(
                            Icons.phone_in_talk_rounded,
                            color: isPhoneSelected ? const Color(0xff848484): Theme.of(context).primaryColor.withOpacity(.6),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Call")
                  ],
                ),
                const SizedBox(width: 28,),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isMapSelected = !isMapSelected;
                          isPhoneSelected = false;
                          Navigator.of(context).pushNamed(MainPage.routeName,arguments: 0);
                        });

                      },
                      child: CircleAvatar(

                        backgroundColor: isMapSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade200,
                        radius: 25,
                        child: Icon(
                          Icons.location_on,
                          color: isMapSelected ? const Color(0xff848484): Theme.of(context).primaryColor.withOpacity(.6),                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Find")
                  ],
                ),
                const Spacer(),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
                Padding(
              padding: EdgeInsets.only(left: 18.0, bottom: 12),
              child: Row(
                children: [
                  Text(
                    "Phone number",
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  Text(
                    "0400 000 000",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            buildDivider(),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, LocationSharingPage.routeName);
              },
              child: Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, bottom: 12, right: 8),
                  child: Row(
                    children: [
                      const Text(
                        "Manage location sharing",
                        style: TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.withOpacity(.8),
                      )
                    ],
                  )),
            ),
            const SizedBox(
              height: 12,
            ),
            buildDivider(),
          ],
        ),
      ),
    ));
  }

  showCallPersonModal({required BuildContext context}) {
    showFlexibleBottomSheet(
        bottomSheetColor: Colors.transparent,
        minHeight: 0,
        initHeight: 0.8,
        maxHeight: 0.8,
        context: context,
        isExpand: false,
        builder: (
          BuildContext context,
          ScrollController scrollController,
          double bottomSheetOffset,
        ) {
          return Material(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
              child: SingleChildScrollView(
                  controller: scrollController, child: const CallPersonModal()));
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )));
  }
}
