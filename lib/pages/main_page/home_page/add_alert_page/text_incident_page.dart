import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/pages/main_page/home_page/widget/report_detail_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../modal_helper/modal_helper.dart';
import '../../../../widget/app_button.dart';

class TextOnlyModal extends StatefulWidget {
  const TextOnlyModal({super.key});

  @override
  State<TextOnlyModal> createState() => _SOSModelState();
}

class _SOSModelState extends State<TextOnlyModal> {
  TextEditingController controller = TextEditingController();
  DateTime? selectedTime;
  DateTime? selectedDate;
  bool isValid = false;

  // var provider = Provider.of<CreateReportProvider>(context);
  checkIsValid() {
    if (controller.text.isNotEmpty &&
        selectedDate != null &&
        selectedTime != null) {
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
          padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(bottom: 20),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Create Report"),
        actions: const [CloseButton()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Constants.getDivider(),
            const Padding(
              padding: EdgeInsets.only(left: 18, top: 12, bottom: 12),
              child: Text(
                "Text only",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(left: 12),
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey)),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  selectedTime == null
                                      ? "Time"
                                      : DateFormat('hh:mm a')
                                          .format(selectedTime!),
                                  style: TextStyle(
                                      color: selectedTime == null
                                          ? Colors.black.withOpacity(.65)
                                          : Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                            ),
                          ),
                          onTap: () async {
                            final pickedTime = await showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 300.0,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    initialDateTime: DateTime.now(),
                                    onDateTimeChanged: (DateTime newDateTime) {
                                      setState(() {
                                        selectedTime = newDateTime;
                                      });
                                    },
                                  ),
                                );
                              },
                            );
                             checkIsValid();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(left: 12),
                              height: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey)),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    selectedDate == null
                                        ? "Date"
                                        : DateFormat('MM/dd/yyyy')
                                            .format(selectedDate!),
                                    style: TextStyle(
                                        color: selectedDate == null
                                            ? Colors.black.withOpacity(.65)
                                            : Colors.black,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                            onTap: () async {
                              final DateTime? pickedDate =
                                  await showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 300.0,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      initialDateTime: selectedDate,
                                      onDateTimeChanged: (DateTime newDate) {
                                        setState(() {
                                          selectedDate = newDate;
                                        });
                                      },
                                    ),
                                  );
                                },
                              );
                              checkIsValid();
                            }),
                      ),
                    ],
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
    );
  }
}
