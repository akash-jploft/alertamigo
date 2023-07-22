import 'package:alertamigo_app/pages/main_page/alerts_page/pages/incident_posts_page.dart';
import 'package:alertamigo_app/pages/main_page/alerts_page/widget/invited_modal.dart';
import 'package:alertamigo_app/pages/main_page/alerts_page/widget/sos_activated_modal.dart';
import 'package:alertamigo_app/pages/main_page/main_page.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';


class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var titleStyle = const TextStyle(fontWeight: FontWeight.w700, fontSize: 18);
    var trailingStyle = const TextStyle(color: Color(0xff535353));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: .5,
        toolbarHeight: 110,
        title: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text("Alerts",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26),)),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            ListTile(
              onTap: () {
                showSOSActivatedModal(context: context);
              },
              title: Text("Tom Pine", style: titleStyle),
              subtitle: const Text("SOS activated by Tom"),
              trailing: Text("2m ago",style: trailingStyle,),
              leading: Container(
                height: 55,
                width: 55,
                decoration:
                    const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                padding: const EdgeInsets.all(3),
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.network(
                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pushNamed(MainPage.routeName,arguments: 0);
              },
              title: Text(
                "Property Damage",
                style: titleStyle,
              ),
              subtitle: const Text("700m away"),
              trailing: Text("31m ago",style: trailingStyle),
              leading: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(12),

                decoration: const BoxDecoration(
                    color: Color(0xffDD352D),
                    shape: BoxShape.circle
                ),
                child: Image.asset("assets/icon/damage.png",),
              ),
            ),
            ListTile(
              onTap: () {
                invitedModal(context: context);
              },
              title: Text(
                "Jess Frond",
                style: titleStyle,
              ),
              subtitle: const Text("Emergency contact invite"),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Yesterday",style: trailingStyle),
                  const SizedBox(height: 18,),
                  const Icon(Icons.circle,
                  color: Colors.red,
                  size: 9,)
                ],
              ),
              leading: Container(
                height: 55,
                width: 55,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.network(
                    "https://img.freepik.com/free-photo/portrait-handsome-man-with-dark-hairstyle-bristle-toothy-smile-dressed-white-sweatshirt-feels-very-glad-poses-indoor-pleased-european-guy-being-good-mood-smiles-positively-emotions-concept_273609-61405.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () =>
                  Navigator.of(context).pushNamed(IncidentPostsPage.routeName),
              title: Text(
                "Incident expiring soon",
                style: titleStyle,
              ),
              subtitle: const Text("Traffic Offence"),
              trailing: Text("30d ago",style: trailingStyle),
              leading: Container(
                height: 55,
                width: 55,
                decoration: const BoxDecoration(
                    color: Color(0xff848484), shape: BoxShape.circle),
                child: Image.asset("assets/icon/car.png"),
              ),
            ),
            ListTile(
              title: Text(
                "Someone's in danger",
                style: titleStyle,
              ),
              subtitle: const Text("Be alert and help if able to do so"),
              trailing: Text("12d ago",style: trailingStyle),
              leading: Container(
                height: 55,
                width: 55,
                decoration:
                    const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                padding: const EdgeInsets.all(3),
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff474747), shape: BoxShape.circle),
                    child: const Center(
                      child: Text(
                        "?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showSOSActivatedModal({required BuildContext context}) {
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
                  controller: scrollController, child: const SOSActivatedModel()));
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )));
  }

  invitedModal({required BuildContext context}) {
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
                  controller: scrollController, child: const InvitedModel()));
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )));
  }
}
