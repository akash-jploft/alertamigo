import 'package:flutter/material.dart';
import '../../../../widget/app_button.dart';

class SOSModel extends StatelessWidget {
  const SOSModel({super.key});
  @override
  Widget build(BuildContext context) {
    return
      Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 35 ,),
        Center(
          child: Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.red,
                width: 3,
              ),
            ),
            child: ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20,),

        const Text("Start SOS mode?",style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20
        ),),
        const SizedBox(height: 10,),

        const Text(
            "Your emergency contacts will be alerted with your location. Your phone will be set to silent.",
        textAlign: TextAlign.center,style: TextStyle(
          letterSpacing: 1.0,fontSize: 14,
        ),),
        const SizedBox(height: 30,),

        AppButton(
            bgColor: const Color(0xffDD352D),
            fgColor: Colors.white,
            onTap: () {
              Navigator.pop(context,true);
            },
            title: "Start"),

        const SizedBox(height: 10,),
        AppButton(
            bgColor: Theme.of(context).disabledColor,
            fgColor: Colors.black,
            onTap: () {
              Navigator.of(context).pop();
            },
            title: "No thanks"),
        const SizedBox(height: 20,),

      ],
      );
  }
}
