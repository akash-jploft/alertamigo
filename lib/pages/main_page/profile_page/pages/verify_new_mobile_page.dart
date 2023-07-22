import 'package:alertamigo_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../widget/app_back_button.dart';


class VerifyNewNumberPage extends StatefulWidget {
  static const routeName = "verify-new-number-page";
  const VerifyNewNumberPage({Key? key}) : super(key: key);

  @override
  _RoundedWithCustomCursorState createState() =>
      _RoundedWithCustomCursorState();

  @override
  String toStringShort() => 'Rounded With Cursor';
}

class _RoundedWithCustomCursorState extends State<VerifyNewNumberPage> {
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

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 18,),

                const AppBackButton(),
                const SizedBox(height: 10,),

                Text("Verify New Number",style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10,),

                Text("Enter the code sent to",
                  style: Theme.of(context).textTheme.headlineLarge,),
                const SizedBox(height: 10,),

                Text("4000 000 000",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600)),


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
                        Constants.getToast(msg: "Mobile number gets updated");

                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
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
                    cursor:   Column(
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