import 'package:alertamigo_app/constants/constants.dart';
import 'package:flutter/material.dart';


class ReportModal extends StatelessWidget {
  const ReportModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> reportList = [
      "Spam",
      "Offensive",
      "Misleading",
      "Bullying or harassment",
      "Privacy Breach",
      "Threat",
      "Other"
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const Text(
              "Report",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(
              height: 10,
            ),
              ...reportList.map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0,bottom: 18),
                      child: Text(e,
                      style: const TextStyle(
                        fontSize: 16
                      ),),
                    ),
                  ),
                  Constants.getDivider()
                ],
              )).toList()
          ],
        ),
      ),
    );
  }
}


