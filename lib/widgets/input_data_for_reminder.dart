import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobi_health_care_app/constants/colors.dart';

class InputDataForReminder extends StatefulWidget {
  final String mediNameForReminder;
  final String mediDescriptionforReminder;
  final int mediTimeHoursForReminder;
  final int mdiTimeMinutesForReminder;
  const InputDataForReminder({
    super.key,
    required this.mediNameForReminder,
    required this.mediDescriptionforReminder,
    required this.mediTimeHoursForReminder,
    required this.mdiTimeMinutesForReminder,
  });

  @override
  State<InputDataForReminder> createState() => _InputDataForReminderState();
}

class _InputDataForReminderState extends State<InputDataForReminder> {
  final TextEditingController notificationTitle = TextEditingController();
  final TextEditingController notificationBody = TextEditingController();
  final TextEditingController notificationTime = TextEditingController();
  final TextEditingController notificationTDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMainPadding),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        child: TextField(
          controller: notificationTitle,
          //hint text desings
          decoration: InputDecoration(
            hintText: "Name",
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: kwidghtBgColor.withAlpha(150),
            ),

            //box design
            filled: true,
            fillColor: kwidghtBgColor.withAlpha(040),
            contentPadding: EdgeInsets.symmetric(horizontal: kMainPadding),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: kSecondaryColor, width: 1.5),
            ),
            //focusColor: kMainBlack.withAlpha(050)
          ),
          //input text design
          style: TextStyle(
            fontSize: 15,
            color: kMainBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
