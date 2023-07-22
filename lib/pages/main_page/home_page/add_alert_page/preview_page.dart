
import 'package:alertamigo_app/pages/main_page/home_page/add_alert_page/report_creation_page.dart';
import 'package:alertamigo_app/widget/app_button.dart';
import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  static const routeName = "preview-page";
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const CloseButton(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          Image.asset("assets/thumbnails.png"),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                AppButton(bgColor: Colors.white, fgColor: Colors.black, onTap: (){
                  Navigator.of(context).pushReplacementNamed(ReportCreationPage.routeName);
                }, title: "Use Photo"),
                const SizedBox(height: 8,),
                AppButton(bgColor: const Color(0xff3B3C40), fgColor: Colors.white, onTap: (){}, title: "Retake"),
                const SizedBox(height: 16,)
              ],
            ),
          ),
      ],
      ),
    );
  }
}
