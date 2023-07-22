

import 'package:alertamigo_app/pages/main_page/alerts_page/widget/user_comment.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class WriteCommentModal extends StatelessWidget {
  const WriteCommentModal({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:  Column(
          children: [
        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
                  Row(
                children: [
                  Spacer(),
                  Text(
                    "Comments",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  CloseButton()
                ],
              ),
              const SizedBox(height: 10,),

              Constants.getDivider(),
              const SizedBox(height: 10,),

              const UserComment(),
              const Divider(),
              const SizedBox(height: 12,),
              const UserComment(),
              const Divider(),
              const SizedBox(height: 12,),

              const UserComment(),
            ],
          ),
        )),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Constants.getDivider(),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 12, bottom: 8,left: 18,right: 18),
                  padding: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: Theme.of(context).primaryColor.withOpacity(.1)),
                  child:
                  const TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: "Write a comment..."),
                  ),
                ),
                const SizedBox(height: 8,),
              ],
            ),

          ],
        ),

      );
  }
}
