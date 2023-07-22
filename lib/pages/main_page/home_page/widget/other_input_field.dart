

import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../widget/app_button.dart';

class OtherInputField extends StatefulWidget {
  const OtherInputField({Key? key}) : super(key: key);

  @override
  State<OtherInputField> createState() => _OtherInputFieldState();
}

class _OtherInputFieldState extends State<OtherInputField> {
  TextEditingController controller = TextEditingController();
  bool isValid = true;

  checkIsValid() {
    setState(() {
      isValid = controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                    Row(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    CloseButton(),
                    Spacer(),
                    SizedBox(height: 28),
                    Text(
                      "Other",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                  ],
                ),
                Constants.getDivider(),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: "Incident"),
                ),
                const SizedBox(
                  height: 18,
                ),
                AppButton(
                    bgColor: isValid
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                    fgColor: isValid ? Colors.white : Colors.grey,
                    onTap: () {
                      if (isValid) {
                        Navigator.pop(context, controller.text.isNotEmpty ? controller.text: null);
                      }
                    },
                    title: "Done"),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          }),
    );
  }
}
