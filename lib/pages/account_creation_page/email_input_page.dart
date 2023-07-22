
import 'package:alertamigo_app/pages/account_creation_page/picture_selection_page.dart';
import 'package:flutter/material.dart';

import '../../widget/app_back_button.dart';
import '../../widget/app_button.dart';

class EmailInputPage extends StatefulWidget {
  static const routeName = "email-input-page";
  const EmailInputPage({super.key});

  @override
  State<EmailInputPage> createState() => _EmailInputPageState();
}

class _EmailInputPageState extends State<EmailInputPage> {

  TextEditingController emailController = TextEditingController();
  bool isValid = false;
  bool isChecked = false;

  checkName() {


    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,})$',
    );
    bool isValidEmail =  emailRegex.hasMatch(emailController.text);
    if (isValidEmail) {
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
        //    resizeToAvoidBottomInset: false,
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
              "Email Address",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Your email address will be used to follow up reports.",
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
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Email address',
                )),
            const SizedBox(height: 16,),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Icon(
                    isChecked?
                    Icons.check_box:   Icons.check_box_outline_blank ),
                ),
                const SizedBox(width: 8,),
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
                        .pushNamed( PictureSectionPage.routeName);
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
