import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color bgColor;
  final Color fgColor;
  const AppButton(
      {super.key,
      required this.bgColor,
      required this.fgColor,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
          elevation: 0.1,
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          minimumSize: const Size(double.infinity, 55)),
      child: Text(title,style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),),
    );
  }
}
