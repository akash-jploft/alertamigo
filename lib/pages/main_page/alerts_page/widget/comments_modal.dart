import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/pages/main_page/alerts_page/widget/user_comment.dart';
import 'package:alertamigo_app/pages/main_page/alerts_page/widget/write_comment_modal.dart';
import 'package:flutter/material.dart';

class CommentsModal extends StatelessWidget {
  const CommentsModal({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
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
          const SizedBox(height: 6,),
          Constants.getDivider(),
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
              showDialog(context: context, builder: (builder){
                return const WriteCommentModal();
              });
            },
            child: Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: Theme.of(context).primaryColor.withOpacity(.1)),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Write a comment...",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ))),
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}


