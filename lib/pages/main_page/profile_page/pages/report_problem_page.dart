import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../widget/app_back_button.dart';
import '../../../../widget/app_button.dart';

class ReportProblemPage extends StatefulWidget {
  static const routeName = "report-problem";

  const ReportProblemPage({Key? key}) : super(key: key);

  @override
  State<ReportProblemPage> createState() => _ReportProblemPageState();
}

class _ReportProblemPageState extends State<ReportProblemPage> {
  XFile? selectedImage;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 12),
        child: AppButton(
          title: "Send",
          bgColor: Theme.of(context).disabledColor,
          fgColor: Colors.grey.shade400,
          onTap: () {},
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: const AppBackButton(),
        title: const Text("Report a problem"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            const TextField(
              decoration: InputDecoration(hintText: "Subject"),
            ),
            const SizedBox(
              height: 12,
            ),
            const TextField(
              decoration: InputDecoration(hintText: "Description"),
              maxLines: 10,
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () async {
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    selectedImage = image;
                  });
                }
              },
              child: selectedImage == null
                  ? Container(
                      padding: const EdgeInsets.all(36),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey)),
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(
                          File(selectedImage!.path).readAsBytesSync(),
                          fit: BoxFit.fitWidth,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
