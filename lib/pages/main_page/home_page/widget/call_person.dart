


import 'package:flutter/material.dart';

import '../../../../widget/app_button.dart';

class CallPersonModal extends StatelessWidget {
  const CallPersonModal({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20,),
          Center(
            child: SizedBox(
              width: 60,
              height: 60,

              child: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20,),

          const Text("Call Jess Frond?",style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20
          ),),

          const SizedBox(height: 30,),

          AppButton(
              bgColor: Theme.of(context).primaryColor,
              fgColor: Colors.white,
              onTap: () {
                Navigator.of(context).pop();
              },
              title: "Call"),

          const SizedBox(height: 10,),
          AppButton(
              bgColor: Theme.of(context).disabledColor,
              fgColor: Colors.black,
              onTap: () {
                Navigator.of(context).pop();
              },
              title: "Cancel"),
          const SizedBox(height: 20,),

        ],
      ),

    );
  }
}
