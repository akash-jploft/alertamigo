import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/pages/main_page/alerts_page/alerts_page.dart';
import 'package:alertamigo_app/pages/main_page/home_page/home_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/profile_page.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'emergency_contacts_page/emergency_contacts_page.dart';

class MainPage extends StatefulWidget {
  final int pageIndex;

  static const routeName = "main-page";

  const MainPage({super.key, required this.pageIndex});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    setState(() {
      _currentIndex = widget.pageIndex;
    });
    super.initState();
  }

  buildIcon({required String iconSrc}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SvgPicture.asset(
        iconSrc,
        height: 28,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getPage(index: _currentIndex),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Constants.getDivider(),
            Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                ),
                child: BottomNavigationBar(
                  // selectedItemColor: Colors.black,
                  // selectedIconTheme: IconThemeData(color: Colors.red),
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  showSelectedLabels: false,
                  iconSize: 26,
                  elevation: 0.0,
                  showUnselectedLabels: false,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: buildIcon(
                        iconSrc: "assets/bottom_bar_icon/map_icon.svg",
                      ),
                      activeIcon: buildIcon(
                        iconSrc: "assets/bottom_bar_icon/map_icon_active.svg",
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: buildIcon(
                          iconSrc: "assets/bottom_bar_icon/emergency_icon.svg"),
                      activeIcon: buildIcon(
                          iconSrc:
                              "assets/bottom_bar_icon/emergency_icon_active.svg"),
                      label: '', // Empty label
                    ),
                    BottomNavigationBarItem(
                      icon: badges.Badge(
                        position: badges.BadgePosition.topEnd(top: 8, end: 8),
                        child: buildIcon(
                            iconSrc: "assets/bottom_bar_icon/alert_icon.svg"),
                      ),
                      activeIcon: badges.Badge(
                        position: badges.BadgePosition.topEnd(top: 8, end: 8),
                        child: buildIcon(
                            iconSrc:
                                "assets/bottom_bar_icon/alert_icon_active.svg"),
                      ),
                      label: '', // Empty label
                    ),
                    BottomNavigationBarItem(
                      icon: buildIcon(
                          iconSrc: "assets/bottom_bar_icon/profile_icon.svg"),
                      activeIcon: buildIcon(
                          iconSrc:
                              "assets/bottom_bar_icon/profile_icon_active.svg"),
                      label: '', // Empty label
                    ),
                  ],
                )),
          ],
        ));
  }

  Widget getPage({required int index}) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const EmergencyContactsPage();
      case 2:
        return const AlertsPage();
      case 3:
        return const ProfilePage();
    }
    return Container();
  }
}
