import 'package:flutter/material.dart';

import '../modal_helper/modal_helper.dart';
import '../model/incident_modal.dart';
import '../pages/main_page/alerts_page/widget/incident_type_modal.dart';

class CreateReportProvider extends ChangeNotifier {
  int? selectedIncidentIndex;
  String? otherText;

  pickIncidentType({required BuildContext context}) async {
    int? index = await showDialog(
        context: context,
        builder: (builder) {
          return const IncidentTypeModal();
        });

    if (index != null) {
      selectedIncidentIndex = index;
      if (incidentList[index].title.toLowerCase() == "other") {
        String? text = await ModalHelper.showOtherInputField(context: context);
        print("text : $text");
        if (text != null) {
          otherText = text;
        } else {
          selectedIncidentIndex = null;
        }
      }
    }
    notifyListeners();
  }

  clearIncidentType() {
    selectedIncidentIndex = null;
    otherText = null;
    notifyListeners();
  }
}
