import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../widget/app_back_button.dart';
import 'create_passcode_page.dart';

class VerifyNumberPage extends StatefulWidget {
  static const routeName = "verify-number-page";
  const VerifyNumberPage({Key? key}) : super(key: key);

  @override
  _RoundedWithCustomCursorState createState() =>
      _RoundedWithCustomCursorState();

  @override
  String toStringShort() => 'Rounded With Cursor';
}

class _RoundedWithCustomCursorState extends State<VerifyNumberPage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String resendText = "Resend";

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusedBorderColor = Theme.of(context).primaryColor;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Colors.black26;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color: Theme.of(context).primaryColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 18,),

                const AppBackButton(),
                const SizedBox(height: 10,),

                Text("Verify Number",style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10,),

                Text("To create your account lets first verify that this is your phone number.",
                style: Theme.of(context).textTheme.headlineLarge,),

                const SizedBox(height: 18,),
                Text("0400 000 000",
                style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w500,fontSize: 18,letterSpacing: 1.2),),
                const SizedBox(height: 40,),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(separator: const SizedBox(width:20 ,),
                    length: 5,
                    controller: pinController,
                    focusNode: focusNode,
                    androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: defaultPinTheme,
                    validator: (value) {
                      if(value != null && value.length ==5){
                        Navigator.of(context).pushNamed(
                          CreatePasscodePage.routeName
                        );
                      }
                      return null;
                    },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                    },
                    onChanged: (value) {
                      debugPrint('onChanged: $value');
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: focusedBorderColor,
                        ),
                      ],
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                  ),
                ),
                const SizedBox(height:50 ,),
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        resendText = "Resend code in 00:54";
                      });
                      formKey.currentState!.validate();
                    },
                    child:  Text(resendText,style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}