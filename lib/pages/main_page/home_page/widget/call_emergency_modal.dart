

import 'package:flutter/material.dart';

import '../../../../widget/app_button.dart';

class CallEmergencyModal extends StatelessWidget {
  const CallEmergencyModal({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 38,),
          Center(
            child: Image.asset("assets/icon/call.png",height: 45,),
          ),

          const SizedBox(height: 20,),

          const Text("Call Emergency Services?",style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20
          ),),
          const SizedBox(height: 10,),

          const Text(
            "Call 000 in the case of an emergency.",
            textAlign: TextAlign.center,style: TextStyle(
            letterSpacing: 1.2,fontSize: 14,
          ),),
          const SizedBox(height: 30,),

          AppButton(
              bgColor: const Color(0xffDD352D),
              fgColor: Colors.white,
              onTap: () {
                Navigator.of(context).pop();
              },
              title: "Call 000"),

          const SizedBox(height: 10,),
          AppButton(
              bgColor: Theme.of(context).disabledColor,
              fgColor: Colors.black,
              onTap: () {
                Navigator.of(context).pop();

              },
              title: "Cancel"),
          const SizedBox(height: 32,),

        ],
      ),

    );
  }
}
