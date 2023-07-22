import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RangeModal extends StatefulWidget {
  const RangeModal({super.key});

  @override
  State<RangeModal> createState() => _RangeModalState();
}

class _RangeModalState extends State<RangeModal> {
  double selectedValue = 15;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close)),
              const Spacer(),
              Text(
                DateFormat.yMMMMEEEEd().format(DateTime.now()),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [Text("A month ago"), Spacer(), Text("Today")],
          ),
          Slider(
            inactiveColor: Theme.of(context).primaryColor.withOpacity(.2),
            activeColor: Theme.of(context).primaryColor,
            min: 1,
            max: 30,
            onChanged: (range) {
              setState(() {
                selectedValue = range;
              });
            },
            value: selectedValue,
          )
        ],
      ),
    );
  }
}
