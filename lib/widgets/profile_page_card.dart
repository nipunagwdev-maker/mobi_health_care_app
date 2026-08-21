import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';

class ProfilePageCard extends StatefulWidget {
  final String profileCardTitleName;
  final int profileCardValue;
  const ProfilePageCard({
    super.key,
    required this.profileCardTitleName,
    required this.profileCardValue,
  });

  @override
  State<ProfilePageCard> createState() => _ProfilePageCardState();
}

class _ProfilePageCardState extends State<ProfilePageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: kMainWhite,
        borderRadius: BorderRadius.circular(15),
        //border: Border.all(color: kMainColor, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1.5, 1.5),
            //blurStyle: BlurStyle.outer,
            blurRadius: 0.2,
            spreadRadius: 0.3,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: kMainPadding),
          Text(
            widget.profileCardTitleName,
            style: TextStyle(
              color: kMainRedColor,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),

          Text(
            widget.profileCardValue.toString(),
            style: TextStyle(
              color: kMainColor,
              fontSize: 80,
              fontWeight: FontWeight.w900,
              height: 1.0, //make the invisible  sized gap for a any text
            ),
          ),
          const SizedBox(height: kMainPadding),
        ],
      ),
    );
  }
}
