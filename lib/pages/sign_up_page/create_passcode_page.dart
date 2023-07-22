
import 'package:alertamigo_app/pages/sign_up_page/verify_passcode_page.dart';
import 'package:alertamigo_app/widget/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CreatePasscodePage extends StatefulWidget {
  static const routeName = "create-passcode-page";
  const CreatePasscodePage({super.key});

  @override
  State<CreatePasscodePage> createState() => _CreatePasscodePageState();
}

class _CreatePasscodePageState extends State<CreatePasscodePage> {
  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const AppBackButton(),
              const SizedBox(height: 10,),
              Text(
                "Create Passcode",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            const SizedBox(height: 10,),
              Text("Create a passcode to unlock Alertamigo.",style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 17,letterSpacing: 1.1
              ),),
              const SizedBox(height: 40,),
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
                      Navigator.of(context).pushNamed(VerifyPasscodePage.routeName);
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
