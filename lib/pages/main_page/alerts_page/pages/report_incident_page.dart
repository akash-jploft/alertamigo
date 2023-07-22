import 'package:flutter/material.dart';

import '../../../../widget/app_back_button.dart';
import '../../../../widget/app_button.dart';
import '../widget/report_modal.dart';

class ReportIncidentPage extends StatefulWidget {
  static const routeName = "report-incident-page";
  const ReportIncidentPage({Key? key}) : super(key: key);

  @override
  State<ReportIncidentPage> createState() => _ReportIncidentPageState();
}

class _ReportIncidentPageState extends State<ReportIncidentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Report Incident"),
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                showWriteCommentModal(context: context);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(color: Colors.grey)
                ),
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Text("Offensive"),
                    const Spacer(),
                    Icon(Icons.arrow_drop_down,color: Colors.grey.shade700,)
                  ],
                ),

              ),
            ),
            const SizedBox(height: 12,),

            const TextField(
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "Description",
              ),
            ),
            const Spacer(),
            AppButton(
                bgColor: Theme.of(context).primaryColor,
                fgColor: Colors.white,
                onTap: () {
                  Navigator.of(context).pop();
                },
                title: "Report"),
            const SizedBox(
              height: 12,
            ),
            AppButton(
                bgColor: Theme.of(context).disabledColor,
                fgColor: Theme.of(context).primaryColor,
                onTap: () {
                  Navigator.of(context).pop();
                },
                title: "Cancel"),
            const SizedBox(
              height: 12,
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
          return const ReportModal();
        });
  }

}