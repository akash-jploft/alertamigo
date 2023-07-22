import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class SearchLocationModal extends StatelessWidget {
  const SearchLocationModal({super.key});

  @override
  Widget build(BuildContext context) {
    buildSearchBar() {
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  Expanded(
                    child: TextField(
                      focusNode: FocusNode(),
                      decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "Search locations..."),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
              child: Text(
                "Cancel",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )

          //cancel button
        ],
      );
    }

    buildRecent() {
      Color iconColor = const Color(0xff848484);
      return InkWell(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: iconColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "123 Forset st, Richmond",
                  style: TextStyle(fontSize: 18),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey.withOpacity(.5),
                  size: 24,
                )
              ],
            ),
            const SizedBox(
              height: 22,
            ),
          ],
        ),
      );
    }

    buildRecents() {
      return Column(
        children: [
          buildRecent(),
          Constants.getDivider(),
          buildRecent(),
          Constants.getDivider(),
          buildRecent(),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 12,
              ),
              buildSearchBar(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Search by address, suburb, postcode, state or city",
                style: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(.8)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Recent",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff848484),
                    fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              buildRecents()
            ],
          ),
        ),
      ),
    );
  }
}
