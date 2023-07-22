import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/widget/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../modal_helper/modal_helper.dart';
import '../widget/report_detail_input.dart';

class AudioIncidentCreationPage extends StatefulWidget {
  static const routeName = "audio-incident-page";

  const AudioIncidentCreationPage({super.key});

  @override
  State<AudioIncidentCreationPage> createState() => _ReportCreationPageState();
}

class _ReportCreationPageState extends State<AudioIncidentCreationPage> {
  TextEditingController controller = TextEditingController();
  bool isValid = false;


  checkIsValid() {
    if (controller.text.isNotEmpty ) {
      isValid = true;
    } else {
      isValid = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(bottom: 12),
            child: AppButton(
              onTap: () {
                if (isValid) {
                  ModalHelper.showIncidentPostedModal(context: context);
                }
              },
              title: "Post",
              bgColor: isValid
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
              fgColor: isValid ? Colors.white : Colors.grey,
            )),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Create Report",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                    const Spacer(),
                    CloseButton(
                      onPressed: () {
                        showDiscardModal(context: context);
                      },
                    )
                  ],
                ),
                Constants.getDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Evidence",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle,
                                color: Color(0xff848484),
                              ))
                        ],
                      ),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.3),
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 3,
                                          color: Theme.of(context).primaryColor,
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 3,
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(.3),
                                        )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Theme.of(context).secondaryHeaderColor,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("11:20am, 20/01/23")
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("12 Forest St, Richmond")
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                        "Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const ReportDetailInput(),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: controller,
                        onChanged: (val) {
                          setState(() {
                            checkIsValid();
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: "Description",
                            hintStyle:
                                TextStyle(fontSize: 16, color: Colors.black54)),
                        maxLines: 4,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor:
                                  Theme.of(context).secondaryHeaderColor),
                          onPressed: () {},
                          child: const Text("Terms of Use"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  showDiscardModal({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (builder) {
          return CupertinoAlertDialog(
            title: const Text("Are you sure you want to discard this new inident?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text("Discard Changes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(foregroundColor: Colors.blue),
                child: const Text("Keep Editing"),
              ),
            ],
          );
        });
  }
}

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
                    Navigator.pop(context, controller.text);
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
