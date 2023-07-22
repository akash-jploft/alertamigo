import 'package:flutter/material.dart';

import '../../alerts_page/pages/incident_detail_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
     return Container(
      padding: const EdgeInsets.only(left: 12, top: 50, bottom: 10),
      decoration: const BoxDecoration(
        color: Color(0xff3B3C40),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("assets/thumbnails.png")),
          const SizedBox(
            width: 12,
          ),
            Column(
            children: [
              Text(
                "Property Damage",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Text(
                    "456 Pine St, Richmond",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(IncidentDetailPage.routeName);
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
