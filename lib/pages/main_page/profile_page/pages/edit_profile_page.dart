import 'dart:io';

import 'package:alertamigo_app/widget/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  static const routeName = "edit-profile-page";

  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController firstNameController =
      TextEditingController(text: "Kristina");
  final TextEditingController lastNameController =
      TextEditingController(text: "Smith");
  final TextEditingController birthdayController =
      TextEditingController(text: "15/02/1992");
  final TextEditingController countryController =
      TextEditingController(text: "Australia");
  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    buildTextField(
        {required TextEditingController controller, required String hintText}) {
      return TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(hintText: hintText, labelText: hintText,),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const AppBackButton(),
        title: const Text("Edit profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.2)),
                        color: Theme.of(context).primaryColor.withOpacity(.1)),
                    child: selectedImage == null
                        ? ClipOval(
                            child: Image.network(
                            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80",
                            fit: BoxFit.cover,
                          ))
                        : ClipOval(
                            child: Image.memory(
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
            const SizedBox(
              height: 30,
            ),
            buildTextField(
                controller: firstNameController, hintText: "First name"),
            const SizedBox(
              height: 12,
            ),
            buildTextField(
                controller: lastNameController, hintText: "Last name"),
            const SizedBox(
              height: 12,
            ),
            buildTextField(
                controller: birthdayController, hintText: "Birthday"),
            const SizedBox(
              height: 12,
            ),
            buildTextField(controller: countryController, hintText: "Country"),
          ],
        ),
      ),
    );
  }
}
