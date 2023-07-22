import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/model/incident_modal.dart';
import 'package:alertamigo_app/widget/app_back_button.dart';
import 'package:flutter/material.dart';

class IncidentTypeModal extends StatelessWidget {
  const IncidentTypeModal({super.key});

  @override
  Widget build(BuildContext context) {
    buildTile({required IncidentModal incident, required int index}) {
      return InkWell(
        onTap: () {
          Navigator.pop(context, index);
        },
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, bottom: 22, top: 18),
          child: Row(
            children: [
              Image.asset(incident.imgSrc),
              const SizedBox(
                width: 18,
              ),
              Text(
                incident.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const AppBackButton(),
        title: const Text("Incident type"),
      ),
      body: Column(
        children: [
          Constants.getDivider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...incidentList
                      .map((incident) => Column(
                            children: [
                              buildTile(
                                  incident: incident,
                                  index: incidentList.indexOf(incident)),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Constants.getDivider(),
                              ),
                            ],
                          ))
                      .toList()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
