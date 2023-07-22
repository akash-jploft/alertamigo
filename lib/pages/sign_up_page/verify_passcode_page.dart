import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../widget/app_back_button.dart';
import 'face_id_page.dart';

class VerifyPasscodePage extends StatefulWidget {
  static const routeName = "verify-passcode-page";
  const VerifyPasscodePage({super.key});

  @override
  State<VerifyPasscodePage> createState() => _VerifyPasscodePageState();
}

class _VerifyPasscodePageState extends State<VerifyPasscodePage> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const AppBackButton(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Re-enter Passcode",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Re-enter the passcode to confirm.",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 40,
              ),

              Center(
                child: SizedBox(
                  width: 200,
                  child: PinCodeTextField(
                    showCursor:false,
                    autoFocus: true,



                    obscuringWidget: const Icon(Icons.circle,size: 12,),
                    appContext: context,

                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      selectedColor: Theme.of(context).primaryColor,

                      activeColor: Colors.transparent,
                      inactiveColor: Colors.black26,
                      fieldHeight: 20,

                    ),
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    onChanged: (value) {
                      if(value.length == 4)  {
                         Navigator.of(context).pushNamed(FaceIdPage.routeName);

                      }
                      setState(() {
                      });
                    },
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
