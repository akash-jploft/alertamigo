import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../model/contact_model.dart';

class LocationSharingPage extends StatefulWidget {
  static const routeName = "account-sharing-page";

  const LocationSharingPage({super.key});

  @override
  State<LocationSharingPage> createState() => _LocationSharingPageState();
}

class _LocationSharingPageState extends State<LocationSharingPage> {
  List<ContactModel> contactList = [
    ContactModel(
        isSelected: false,
        name: "Jess Frond",
        distance: "3Km",
        imgSrc:
        "https://images.unsplash.com/photo-1499155286265-79a9dc9c6380?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1368&q=80"),
    ContactModel(isSelected: true,
        name: "Tom Pine",
        distance: "900m",
        imgSrc:
        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1364&q=80"),
    ContactModel(
        isSelected: true,
        name: "Amy Forest",
        distance: "Invite sent",
        imgSrc:
        "https://images.unsplash.com/photo-1464863979621-258859e62245?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=700&q=60"),
  ];
  @override
  Widget build(BuildContext context) {


    buildDivider() {
      return Padding(
        padding: const EdgeInsets.only(left: 60),
        child: Constants.getDivider(),
      );
    }

    buildContactTile({required ContactModel contact}) {
      return InkWell(
        onTap: ()  {
         },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Container(
                    height:50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.network(contact.imgSrc,fit: BoxFit.cover, ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.name,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor, fontSize: 18),
                      ),
                      Text(contact.distance,style: TextStyle(
                          color:     Theme.of(context).primaryColor.withOpacity(.8)
                      ),)
                    ],
                  ),
                  const Spacer(),
                 IconButton(onPressed: (){
                   setState(() {
                   int idx =  contactList.indexOf(contact);

                   contactList[idx] = ContactModel(distance: contact.distance, imgSrc: contact.imgSrc, name: contact.name, isSelected: !contact.isSelected);

                   });

                 }, icon: Icon(
                   contact.isSelected?
                   Icons.check_box : Icons.check_box_outline_blank,color: Theme.of(context).primaryColor,)),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
            buildDivider(),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location sharing",
              style:Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 25
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                "Choose who can see where you are when SOS is not active.",
                style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(.8)),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              "Can always see my location",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(.8)),
            ),
            const SizedBox(height: 12,),
            ...contactList.map((contact) => buildContactTile(contact: contact))
          ],
        ),
      ),
    );
  }
}
