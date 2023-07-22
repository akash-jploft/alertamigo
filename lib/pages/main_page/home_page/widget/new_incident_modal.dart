import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/pages/main_page/home_page/add_alert_page/audio_incident_page.dart';
import 'package:alertamigo_app/pages/main_page/home_page/add_alert_page/text_incident_page.dart';
import 'package:alertamigo_app/services/media_services.dart';
import 'package:flutter/material.dart';

import '../add_alert_page/preview_page.dart';

class NewIncidentModal extends StatelessWidget {
  const NewIncidentModal({super.key});

  @override
  Widget build(BuildContext context) {
    buildTitle({
      required String title,
      required VoidCallback onTap,
      required IconData icon,
    }) {
      Color iconColor = const Color(0xff848484);
      return InkWell(
        onTap: () => onTap(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Constants.getDivider(),
            ),
          ],
        ),
      );
    }

    return Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "New Incident",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              buildTitle(
                  title: "Record a Video",
                  onTap: () async {
                    await MediaServices.captureVideo();
                    Navigator.of(context).pushNamed(PreviewPage.routeName);
                  },
                  icon: Icons.video_camera_back_sharp),
              buildTitle(
                  title: "Take a Photo",
                  onTap: () async {
                    await MediaServices.captureImage();
                    Navigator.of(context).pushNamed(PreviewPage.routeName);
                  },
                  icon: Icons.camera_alt),
              buildTitle(
                  title: "Record Audio",
                  onTap: () async {
                    Navigator.of(context).pushNamed(AudioIncidentCreationPage.routeName);
                  },
                  icon: Icons.mic_rounded),
              buildTitle(
                  title: "Text Only", onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return  const TextOnlyModal();
                }));
              }, icon: Icons.note_rounded),
              const SizedBox(
                height: 30,
              ),
            ]));
  }
}
