import 'package:alertamigo_app/pages/sign_up_page/verify_number_page.dart';
import 'package:flutter/material.dart';
import '../../widget/app_button.dart';

class MobileInputPage extends StatefulWidget {
  static const routeName = "mobile-input-page";

  const MobileInputPage({super.key});

  @override
  State<MobileInputPage> createState() => _MobileInputPageState();
}

class _MobileInputPageState extends State<MobileInputPage> {
  TextEditingController phoneController = TextEditingController();
  bool isValid = false;

  checkPhone({required int length}) {
    if (
    length >=1
    //length >= 10 && length <=15
    ) {
      isValid = true;
    } else {
      isValid = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              "assets/app_icon.jpg",
              height: 80,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Alertamigo",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Enter your mobile number. If you don't have an account we'll create one.",
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
                onChanged: (input) {
                  checkPhone(length: input.length);
                },
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(

                  labelText: 'Mobile',
                )),
            const SizedBox(
              height: 30,
            ),
            AppButton(
                bgColor: isValid
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
                fgColor: isValid ? Colors.white : Colors.black38,
                onTap: () {
                  if (isValid) {
                    Navigator.of(context).pushNamed(VerifyNumberPage.routeName);
                  }
                },
                title: "Continue"),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 18.0, color: Colors.black),
                children: <TextSpan>[
                  const TextSpan(
                    text: 'By continuing you agree to our ',
                    style: TextStyle(fontSize: 13),
                  ),
                  TextSpan(
                      text: ' Terms of Service ',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13)),
                  const TextSpan(
                    text: '\nand ',
                    style: TextStyle(fontSize: 13),
                  ),
                  TextSpan(
                      text: ' Privacy Policy',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }
}
