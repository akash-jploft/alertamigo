import 'package:flutter/material.dart';

import '../../../../widget/app_button.dart';

class InvitedModel extends StatefulWidget {
  const InvitedModel({super.key});

  @override
  State<InvitedModel> createState() => _InvitedModelState();
}

class _InvitedModelState extends State<InvitedModel> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.transparent,
                  width: 3,
                ),
              ),
              child: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Jess Frond invited you be an emergency contact",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "If Jess activates SOS mode, you will be alerted and your location will be shared with Jess.",
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 1.0,
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Always share location",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "You can Change this later in Account settings",
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  icon: Icon(
                    isSelected
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: Theme.of(context).primaryColor,
                  ))
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          AppButton(
              bgColor: Theme.of(context).primaryColor,
              fgColor: Colors.white,
              onTap: () {
                Navigator.pop(context, true);
              },
              title: "Accept"),
          const SizedBox(
            height: 10,
          ),
          AppButton(
              bgColor: Theme.of(context).disabledColor,
              fgColor: Colors.black,
              onTap: () {
                Navigator.of(context).pop();
              },
              title: "Decline"),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
