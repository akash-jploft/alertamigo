import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/modal_helper/modal_helper.dart';
import 'package:alertamigo_app/pages/main_page/home_page/widget/custom_app_bar.dart';
import 'package:alertamigo_app/pages/main_page/home_page/widget/map_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showAppBar = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: showAppBar ? const CustomAppBar() : null,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Constants.getDivider(),
          InkWell(
            onTap: () => ModalHelper.showLocationShareModal(context: context),
            child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '12 Forest St, Richmond',
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                                text: '\n45.35267, 12.49432',
                                style: TextStyle(

                                    fontSize: 13)),
                       
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(Icons.arrow_drop_down),
                    const SizedBox(width: 4,),

              
                    InkWell(
                      onTap: () => ModalHelper.showSOSModal(context: context),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color(0xffDD352D),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Text(
                          "SOS",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          backgroundColor: const Color(0xff474747),
          onPressed: () => ModalHelper.showNewIncident(context: context),
          heroTag: null,
          child: Image.asset(
            "assets/icon/add_incident.png",
            height: 25,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          backgroundColor: const Color(0xff848484),
          onPressed: () => ModalHelper.showRangeModal(context: context),
          heroTag: null,
          child: Image.asset(
            "assets/icon/history.png",
            height: 25,
          ),
        )
      ]),
      body: Stack(
        children: [
          const MapScreen(),
          Positioned(
            top: showAppBar ? 130 : 80,
            left: 20,
            child: InkWell(
              onTap: () =>
                  ModalHelper.showSearchLocationModal(context: context),
              child: const CircleAvatar(
                radius: 26,
                backgroundColor: Color(0xff6B6B6B),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 75,
            child: InkWell(
              onTap: () {
                setState(() {
                  showAppBar = !showAppBar;
                });
              },
              child: Image.asset(
                showAppBar
                    ? "assets/icon/incident_map_icon.png"
                    : "assets/icon/incident_map_icon_inactie.png",
                height: 110,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


