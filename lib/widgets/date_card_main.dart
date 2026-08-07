import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';

class DateCardMain extends StatefulWidget {
  final String dayName;
  final String dayValue;
  final bool isToday;

  const DateCardMain({
    super.key,
    required this.dayName,
    required this.dayValue,
    required this.isToday,
  });

  @override
  State<DateCardMain> createState() => _DateCardMainState();
}

class _DateCardMainState extends State<DateCardMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        color: widget.isToday ? kMainColor : kMainWhite,

        //color: kwidghtBgColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(height: 7),
          Text(
            widget.dayName,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: widget.isToday ? kMainWhite : kMainBlack,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            widget.dayValue,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
              color: widget.isToday ? kMainWhite : kMainBlack,
            ),
          ),
          const SizedBox(height: 7),
        ],
      ),
    );
  }
}
