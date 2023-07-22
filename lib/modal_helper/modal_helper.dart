import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../pages/main_page/home_page/add_alert_page/audio_incident_page.dart';
import '../pages/main_page/home_page/widget/call_emergency_modal.dart';
import '../pages/main_page/home_page/widget/call_person.dart';
import '../pages/main_page/home_page/widget/location_modal.dart';
import '../pages/main_page/home_page/widget/location_search_modal.dart';
import '../pages/main_page/home_page/widget/new_incident_modal.dart';
import '../pages/main_page/home_page/widget/range_modal.dart';
import '../pages/main_page/home_page/widget/sos_modal.dart';
import '../pages/main_page/main_page.dart';

class ModalHelper {
  static showIncidentPostedModal({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 28),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 22,
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Image.asset(
                    "assets/icon/damage.png",
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Incident posted",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Incidents apper on the map, and as notification for other people nearby.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(MainPage.routeName,arguments: 0);
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).primaryColor.withOpacity(.8),
                          minimumSize: const Size(100, 40),
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(.1)),
                      child: const Text(
                        "Done",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          );
        });
  }

  static showOtherInputField({required BuildContext context}) async {
    String? res = await showModalBottomSheet(
      isScrollControlled: true, // Allow modal sheet content to scroll
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const OtherInputField());
      },
    );
    return res;
  }

  static showSOSModal({required BuildContext context}) async {
    bool? sosRes = await showFlexibleBottomSheet(
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
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SingleChildScrollView(
                      controller: scrollController, child: const SOSModel())));
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )));

    if (sosRes == true) {
      showCallEmergencyModal(context: context);
    }
  }

  static showCallEmergencyModal({required BuildContext context}) {
    return showFlexibleBottomSheet(
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
                  controller: scrollController, child: const CallEmergencyModal()));
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )));
  }

  static showNewIncident({required BuildContext context}) async {
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
                  controller: scrollController, child: const NewIncidentModal()));
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )));
  }

  static showRangeModal({required BuildContext context}) {
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
                  controller: scrollController, child: const RangeModal()));
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )));
  }

  static showLocationShareModal({required BuildContext context}) {
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
          return Stack(
            children: [
              Material(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                  child: SingleChildScrollView(
                      controller: scrollController,
                      child: const LocationShareModal())),
              Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 20,
                  top: 7,
                  child: Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(28)),
                  )),
            ],
          );
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )));
  }

  static showCallPersonModal({required BuildContext context}) {
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

  static showSearchLocationModal({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (context) {
          return const SearchLocationModal();
        });
  }
}
