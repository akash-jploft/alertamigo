import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/modal_helper/modal_helper.dart';
import 'package:alertamigo_app/pages/main_page/emergency_contacts_page/pages/contact_detail_page.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

 import '../../../model/contact_model.dart';
import '../home_page/widget/call_emergency_modal.dart';
import '../home_page/widget/sos_modal.dart';

class EmergencyContactsPage extends StatelessWidget {
  const EmergencyContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ContactModel> contactList = [
      ContactModel(
        isSelected: true,

          name: "Jess Frond",
          distance: "3Km",
          imgSrc:
              "https://images.unsplash.com/photo-1499155286265-79a9dc9c6380?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1368&q=80"),
      ContactModel(
        isSelected: false,
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
    buildDivider() {
      return Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Constants.getDivider(),
      );
    }

    buildEmergencyTile() {
      return InkWell(
        onTap: () {
          showCallEmergencyModal(context: context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Text(
                "000 (Emergency services)",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24,
                color: Colors.grey.withOpacity(.8),
              ),
              const SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      );
    }

    buildAddNewContact() {
      return InkWell(
        onTap: () async {
          final PhoneContact contact =
              await FlutterContactPicker.pickPhoneContact();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Color(0xff848484),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Text(
                "New Contact",
                style: TextStyle(
                    color: Color(0xff848484), fontSize: 18),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24,
                color: Colors.grey.withOpacity(.8),
              ),
              const SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      );
    }

    buildContactTile({required ContactModel contact}) {
      return InkWell(
        onTap: ()  {
          Navigator.of(context).pushNamed(ContactDetailPage.routeName,arguments: contact);
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 24,
                    color: Colors.grey.withOpacity(.8),
                  ),
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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Constants.getDivider(),
          InkWell(
            onTap: () => ModalHelper.showLocationShareModal(context: context),
            child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '12 Forest St, Richmond',
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                                text: '\n45.35267, 12.49432',
                                style: TextStyle(

                                    fontSize: 13)),

                          ],
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down),
                    InkWell(
                      onTap: () => showSOSModal(context: context),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color(0xffDD352D),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Text(
                          "SOS",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),


      appBar:    AppBar(
        automaticallyImplyLeading: false,
        elevation: .5,
        toolbarHeight: 130,
        title: Padding(
          padding: const EdgeInsets.only(top: 50),
            child: Text("Emergency Contacts",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26),)),
        actions: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: ()async {
                  final PhoneContact contact =
                  await FlutterContactPicker.pickPhoneContact();

                },
                icon: Icon(
                  Icons.add_circle_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.only(left: 18),
        child: Column(
          children: [

            const SizedBox(height: 8,),
            buildEmergencyTile(),
            buildDivider(),
            buildAddNewContact(),
            buildDivider(),
            ...contactList.map((contact) => buildContactTile(contact: contact))
          ],
        ),
      ),
    );
  }

  showSOSModal({required BuildContext context}) async{
    bool? sosRes =  await showFlexibleBottomSheet(
        bottomSheetColor: Colors.transparent,
        minHeight: 0,
        initHeight: 0.8,
        maxHeight: 0.8,
        context: context,
        isExpand: false,
        builder: (
            BuildContext context,
            ScrollController scrollController,
            double bottomSheetOffset,
            ) {
          return Material(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SingleChildScrollView(
                      controller: scrollController, child: const SOSModel())));
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            )));

    print(sosRes);
    if(sosRes == true){
      showCallEmergencyModal(context: context);
    }
  }



  showCallEmergencyModal({required BuildContext context}) {
    return showFlexibleBottomSheet(
        bottomSheetColor: Colors.transparent,
        minHeight: 0,
        initHeight: 0.8,
        maxHeight: 0.8,
        context: context,
        isExpand: false,
        builder: (
          BuildContext context,
          ScrollController scrollController,
          double bottomSheetOffset,
        ) {
          return Material(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
              child: SingleChildScrollView(
                  controller: scrollController, child: const CallEmergencyModal()));
        },
        isSafeArea: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        )));
  }
}
