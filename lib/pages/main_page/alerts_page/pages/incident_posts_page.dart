

import 'package:flutter/material.dart';

import '../../../../widget/app_back_button.dart';
import 'incident_detail_page.dart';

class IncidentPostsPage extends StatelessWidget {
  static const routeName = "incident-posts-page";
  const IncidentPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (

      appBar: AppBar(
        centerTitle: true,
        leading: const AppBackButton(),
        title:const Text("Incident posts"),
      elevation: .5,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: ()=>Navigator.of(context).pushNamed(IncidentDetailPage.routeName),
              title: const Text("Property Damage",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18
              )
                ,),
              subtitle: const Text("12 Forest St, Richmond"),
              trailing: const Text("2w ago"),
              leading: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(12),
                  
                decoration: const BoxDecoration(
                    color: Color(0xffDD352D),
                    shape: BoxShape.circle
                ),
                child: Image.asset("assets/icon/damage.png",),
              ),
            ),
          ],
        ),
      ),


    );
  }
}
