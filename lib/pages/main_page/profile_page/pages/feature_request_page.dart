

import 'package:alertamigo_app/widget/app_back_button.dart';
import 'package:alertamigo_app/widget/app_button.dart';
import 'package:flutter/material.dart';

class FeatureRequestPage extends StatefulWidget {
  static const routeName = "feature-request-page";
  const FeatureRequestPage({Key? key}) : super(key: key);

  @override
  State<FeatureRequestPage> createState() => _FeatureRequestPageState();
}

class _FeatureRequestPageState extends State<FeatureRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12,),
        child: AppButton(bgColor: Theme.of(context).primaryColor,title: "Send",
        onTap: (){

        },fgColor: Colors.white),
      ),
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text("Feature request"),
        centerTitle: true,
      ),
      body:     SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: 6,),
            TextField(maxLines: 10,
              decoration: InputDecoration(
                hintText: "What would make Alertamigo more useful to you?"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
