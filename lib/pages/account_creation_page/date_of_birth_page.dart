import 'package:alertamigo_app/constants/constants.dart';
import 'package:alertamigo_app/pages/account_creation_page/email_input_page.dart';
import 'package:flutter/material.dart';

import '../../widget/app_back_button.dart';
import '../../widget/app_button.dart';

class DateOfBirthPage extends StatefulWidget {
  static const routeName = "date-of-birth-page";

  const DateOfBirthPage({super.key});

  @override
  State<DateOfBirthPage> createState() => _DateOfBirthPageState();
}

class _DateOfBirthPageState extends State<DateOfBirthPage> {
  bool isValid = false;

  DateTime? selectedDate;

  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  checkIsValid() {
    try {
      selectedDate = DateTime(int.parse(yearController.text),
          int.parse(monthController.text), int.parse(dayController.text));
      print(selectedDate);
      isValid = true;
    } catch (e) {
      print(e);
      isValid = false;
    }
    setState(() {});
  }

  bool isDateGreaterThan18Years(DateTime date) {
    DateTime currentDate = DateTime.now();
    DateTime compareDate = currentDate.subtract(const Duration(days: 365 * 18));
    return date.isBefore(compareDate);
  }

  @override
  Widget build(BuildContext context) {
    buildDateWidget() {
      return
        InkWell(
          onTap: () async {

                DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now());

                if (date != null) {
                  selectedDate = date;
                  dayController = TextEditingController(text: date.day.toString().length == 1 ? "0${date.day}" :date.day.toString() );
                  monthController = TextEditingController(text: date.month.toString().length == 1 ? "0${date.month}" :date.month.toString() );
                  yearController = TextEditingController(text: date.year.toString());
                 if(!isDateGreaterThan18Years(date)){
                   Constants.getToast(msg: "Premium not available for underage");
                   isValid = false;
                 }else{
                   isValid = true;
                 }
                  setState(() {});
                }

          },
          child: AbsorbPointer(
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                onChanged: (_) {
                  checkIsValid();
                },
                keyboardType: TextInputType.number,
                controller: dayController,
                decoration: const InputDecoration(label: Text("Day")),
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextField(
                onChanged: (_) {
                  checkIsValid();
                },
                keyboardType: TextInputType.number,
                controller: monthController,
                decoration: const InputDecoration(label: Text("Month")),
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (_) {
                  checkIsValid();
                },
                controller: yearController,
                decoration: const InputDecoration(label: Text("Year")),
              )),
            ],
          ),
      ),
        );
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const AppBackButton(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Date of birth",
                style: Theme.of(context).textTheme.titleLarge,
              ),
             //  SizedBox(
             //    height: 20,
             //  ),
             // const  Text(
             //    "When using the premium version your Date of Birth will need to be verified against your ID",
             //    style: TextStyle(fontSize: 18, letterSpacing: 1.4),
             //  ),
              const SizedBox(
                height: 30,
              ),

              buildDateWidget(),

              const Spacer(),
              AppButton(
                  bgColor: isValid
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor,
                  fgColor: isValid ? Colors.white : Colors.black38,
                  onTap: () {
                    if (isValid) {
                      Navigator.of(context).pushNamed(EmailInputPage.routeName);
                    }
                  },
                  title: "Continue"),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
