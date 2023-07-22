import 'package:alertamigo_app/pages/account_creation_page/date_of_birth_page.dart';
import 'package:alertamigo_app/widget/app_back_button.dart';
import 'package:flutter/material.dart';

import '../../widget/app_button.dart';

class AccountCreationNamePage extends StatefulWidget {
  static const routeName = "account-creation-page";
  const AccountCreationNamePage({super.key});

  @override
  State<AccountCreationNamePage> createState() =>
      _AccountCreationNamePageState();
}

class _AccountCreationNamePageState extends State<AccountCreationNamePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  bool isValid = false;

  checkName() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty) {
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
           body: Padding(
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
              "What's your name?",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   "When using the premium version your name will need to be verified against your ID.",
            //   style: TextStyle(fontSize: 18, letterSpacing: 1.4),
            // ),
            const SizedBox(
              height: 28,
            ),
            TextField(
                onChanged: (input) {
                  checkName();
                },
                controller: firstNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'First Name',
                )),
            const SizedBox(
              height: 18,
            ),
            TextField(
                onChanged: (input) {
                  checkName();
                },
                controller: lastNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Last Name',
                )),
            const Spacer(),
            AppButton(
                bgColor: isValid
                    ? Theme
                    .of(context)
                    .primaryColor
                    : Theme
                    .of(context)
                    .disabledColor,
                fgColor: isValid ? Colors.white : Colors.black38,
                onTap: () {
                  if (isValid) {
                    Navigator.of(context)
                        .pushNamed(DateOfBirthPage.routeName);
                  }
                },
                title: "Continue"),

            const SizedBox(
            height: 20,
          )
          ]),
    ),)
    ,
    );
  }
}
