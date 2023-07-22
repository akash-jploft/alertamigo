import 'package:flutter/material.dart';

class UserComment extends StatelessWidget {
  const UserComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
            Row(
          children:[
            Text("Lorem ispem dolor sit amet.",style: TextStyle(fontSize: 15),), Spacer(),
            Text("1d ago")
          ],
        ),
        Row(
          children: [
            Image.asset("assets/icon/up_vote.png"),
            const Text("12"),

            const SizedBox(width: 24,),
            Image.asset("assets/icon/down_vote.png"),
            const SizedBox(width: 24,),
            const Text("Reply"),

            const Spacer(),

            PopupMenuButton<String>(
              initialValue: "",
              constraints:   const BoxConstraints(minWidth: 200),
              shape:   const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              // Callback that sets the selected popup menu item.
              onSelected: (item) {
                print(item);
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(
                  value: "1",
                  child: Row(
                    children: [
                      Text('Report'),
                      Spacer(),
                      Icon(Icons.flag_outlined),
                    ],
                  ),
                ),
                    PopupMenuItem(
                  value: "2",
                  child: Row(
                    children: [
                      Text('Share'),
                      Spacer(),
                      Icon(Icons.share_outlined),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),


      ],
    );
  }
}