import 'package:alertamigo_app/pages/main_page/profile_page/pages/verify_new_mobile_page.dart';
import 'package:flutter/material.dart';

import '../../../../widget/app_back_button.dart';
import '../../../../widget/app_button.dart';

class NewMobilePage extends StatefulWidget {
  static const routeName = "new-email-input-page";

  const NewMobilePage({super.key});

  @override
  State<NewMobilePage> createState() => _EmailInputPageState();
}

class _EmailInputPageState extends State<NewMobilePage> {
  TextEditingController emailController = TextEditingController();
  bool isValid = false;
  bool isChecked = false;

  checkName() {
    if (emailController.text.isNotEmpty) {
      isValid = true;
    } else {
      isValid = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            const AppBackButton(),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Enter New Mobile",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Enter your new mobile number.",
              style: TextStyle(fontSize: 18, letterSpacing: 1.4),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
                onChanged: (input) {
                  checkName();
                },
                controller: emailController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'New mobile number...',
                )),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Icon(isChecked
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
                ),
                const SizedBox(
                  width: 8,
                ),
                const   Text("Receive the latest news about Alertamigo")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            AppButton(
                bgColor: isValid
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
                fgColor: isValid ? Colors.white : Colors.black38,
                onTap: () {
                  if (isValid) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (builder) {
                      return const VerifyNewNumberPage();
                    }));
                  }
                },
                title: "Continue"),
            const SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }
}
