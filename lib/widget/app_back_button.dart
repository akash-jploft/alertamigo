

import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return    InkWell(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: const Padding(
          padding: EdgeInsets.only(right: 12,top: 12, bottom: 12),
          child: Icon(Icons.arrow_back_ios),
        ));
  }
}
