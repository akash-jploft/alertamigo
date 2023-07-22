
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
 static getDivider() {
    return Container(
      height: 1,
      color: Colors.grey.withOpacity(.2),
      width: double.infinity,
    );
  }

 static getToast({required String msg}){
   return Fluttertoast.showToast(
       msg: msg,
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM_RIGHT,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.grey.shade900,
       textColor: Colors.white,
       fontSize: 16.0
   );
  }

}
