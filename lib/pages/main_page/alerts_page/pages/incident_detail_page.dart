import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/pages/main_page/alerts_page/pages/report_incident_page.dart';
import 'package:alertamigo_app/pages/main_page/alerts_page/widget/comments_modal.dart';
import 'package:alertamigo_app/pages/main_page/alerts_page/widget/write_comment_modal.dart';
import 'package:alertamigo_app/widget/app_back_button.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipsum/ipsum.dart';
import 'package:share_plus/share_plus.dart';

import '../widget/report_modal.dart';

class IncidentDetailPage extends StatefulWidget {
  static const routeName = "incident-detail-page";

  const IncidentDetailPage({super.key});

  @override
  State<IncidentDetailPage> createState() => _IncidentDetailPageState();
}

class _IncidentDetailPageState extends State<IncidentDetailPage> {
  buildDivider(){
    return Container(height: 1,color: Colors.black54,);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Constants.getDivider(),
          InkWell(
            onTap: () {
              showWriteCommentModal(context: context);
            },
            child: Container(
                height: 50,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 18),
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(28)),
                    color: Theme.of(context).primaryColor.withOpacity(.1)),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Write a comment...",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ))),
          )
        ],
      ),
      appBar: AppBar(
        elevation: .3,
        leading: const AppBackButton(),
        actions: [
          PopupMenuButton<String>(
            shadowColor: Colors.black,
            surfaceTintColor: Colors.black,
            offset: const Offset(-8, 0),

            position:PopupMenuPosition.under ,
            icon: const Icon(Icons.more_horiz),
            padding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18))),

            onSelected: (String item) {
              print(item);
            //  Navigator.of(context).pop();
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(


                padding: EdgeInsets.zero,
                value: "Report",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ReportIncidentPage.routeName);
                        },
                        child:     SizedBox(
                          height: 30,
                          width: 220,
                          child: Row(
                            children: [
                              SizedBox(width: 12,),
                              Text("Report"),
                              Spacer(),
                              Icon(CupertinoIcons.flag),
                              SizedBox(width: 12,),
                            ],
                          ),
                        )),
                    const SizedBox(height: 4,),

                    buildDivider()

                  ],
                ),
              ),
              PopupMenuItem<String>(
                padding: EdgeInsets.zero,
                value: "Share",
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          Share.share('check out new post https://example.com');
                        },
                        child:     Row(
                          children: [
                            SizedBox(width: 12,),
                            Text("Share"),
                            Spacer(),
                            Icon(CupertinoIcons.share),
                            SizedBox(width: 12,),
                          ],
                        )),
                    const SizedBox(height: 8,),
                    buildDivider(),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                padding: EdgeInsets.zero,
                height: 35,

                value: "Delete",
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          showCupertinoDialog(
                              context: context,
                              builder: (builder) {
                                return CupertinoAlertDialog(
                                  title: const Text(
                                    "Are you sure you want to delete this incident?",
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, false);
                                        },
                                        child: const Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, true);
                                        },
                                        child: const Text("Keep")),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          child:     Row(
                            children: [
                              SizedBox(width: 12,),
                              Text(
                                "Delete",
                                style: TextStyle(color: Colors.red),
                              ),
                              Spacer(),
                              Icon(
                                CupertinoIcons.clear,
                                color: Colors.red,
                              ),
                              SizedBox(width: 12,),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                child: Image.asset("assets/thumbnails.png")),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Icon(
                  Icons.camera_alt,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Today",
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const Spacer(),
                Text(
                  "11:20am",
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Property Damage",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              Ipsum().words(20),
              style: TextStyle(
                  color: Colors.black.withOpacity(.8),
                  letterSpacing: 1.5,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "700m away",
                  style:
                      TextStyle(color: Theme.of(context).secondaryHeaderColor),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "12 Forest St, Richmond",
                  style:
                      TextStyle(color: Theme.of(context).secondaryHeaderColor),
                ),
                const SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset("assets/icon/up_vote.png"),
                const Text("12"),
                const SizedBox(
                  width: 24,
                ),
                Image.asset("assets/icon/down_vote.png"),
                const SizedBox(
                  width: 24,
                ),
                const Text("Reply"),
                const Spacer(),
                InkWell(
                    onTap: () {
                      showCommentModal(context: context);
                    },
                    child: Image.asset(
                      "assets/icon/comment.png",
                    )),
                const SizedBox(
                  width: 12,
                ),
                const Text("5"),
                const SizedBox(
                  width: 12,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  showWriteCommentModal({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (builder) {
          return const WriteCommentModal();
        });
  }

  showReportModal({required BuildContext context}) {
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
                  controller: scrollController, child: const ReportModal()));
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )));
  }

  showCommentModal({required BuildContext context}) {
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
                  controller: scrollController, child: const CommentsModal()));
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )));
  }
}
