import 'package:flutter/material.dart';

class AppTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const AppTile(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          children: [
            const SizedBox(
            height: 18,
          ),
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,

                    fontWeight: FontWeight.w400
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey.withOpacity(.8),
                  size: 18,
                ),
                const SizedBox(width: 16,)
              ],
            ),
            const SizedBox(
              height: 18,
            ),


          ],
        ),
      ),
    );
  }
}
