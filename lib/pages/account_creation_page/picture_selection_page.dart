import 'package:alertamigo_app/pages/account_creation_page/permission_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widget/app_back_button.dart';
import '../../widget/app_button.dart';
import 'dart:io';

class PictureSectionPage extends StatefulWidget {
  static const routeName = "picture-section-page";
  const PictureSectionPage({super.key});

  @override
  State<PictureSectionPage> createState() => _PictureSectionPageState();
}

class _PictureSectionPageState extends State<PictureSectionPage> {
  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;
  bool isValid = true;

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
              "Your profile picture",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Add a profile picture so your emergency contacts can identify who you are in the app.",
              style: TextStyle(fontSize: 18, letterSpacing: 1.4),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.2)),
                        color: Theme.of(context).primaryColor.withOpacity(.1)),
                    child:
                        selectedImage == null ? null:
                    ClipOval(
                      child:
                      Image.memory(
                        File(selectedImage!.path).readAsBytesSync(),
                        fit: BoxFit.cover,
                        // width: 150,
                        // height: 150,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: MediaQuery.of(context).size.width * .30,
                    child: InkWell(
                      onTap: () async {
                        final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          setState(() {
                            selectedImage = image;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ))
              ],
            ),
            const Spacer(),
            AppButton(
                bgColor: selectedImage != null
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
                fgColor: selectedImage != null ? Colors.white : Colors.black38,
                onTap: () {
                  if (selectedImage != null) {
                    Navigator.of(context)
                        .pushNamed( PermissionsPage.routeName
                    );
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
