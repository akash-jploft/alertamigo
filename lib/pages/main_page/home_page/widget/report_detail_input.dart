import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/incident_modal.dart';
import '../../../../provider/create_report_provider.dart';

class ReportDetailInput extends StatefulWidget {
  const ReportDetailInput({Key? key}) : super(key: key);

  @override
  State<ReportDetailInput> createState() => _ReportDetailInputState();
}

class _ReportDetailInputState extends State<ReportDetailInput> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var provider = Provider.of<CreateReportProvider>(context, listen: false);
      provider.clearIncidentType();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateReportProvider>(builder: (context, provider, _) {
      return InkWell(
        onTap: () async {
          provider.pickIncidentType(context: context);
        },
        child: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Row(
            children: [
              provider.selectedIncidentIndex != null
                  ? Row(
                      children: [
                        Image.asset(
                            incidentList[provider.selectedIncidentIndex!]
                                .imgSrc),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(incidentList[provider.selectedIncidentIndex!]
                                    .title
                                    .toLowerCase() !=
                                "other"
                            ? incidentList[provider.selectedIncidentIndex!]
                                .title
                            : provider.otherText ?? "Select Incident")
                      ],
                    )
                  : const Text(
                      "Incident type",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
              const Spacer(),
              const Icon(
                Icons.keyboard_arrow_down_sharp,
                size: 22,
                color: Colors.black54,
              )
            ],
          ),
        ),
      );
    });
  }
}
