import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/data/user_data.dart';

class UserDetailsCard extends StatefulWidget {
  final String titleOfTheCard;
  final String contentForTitleCard;
  // ignore: unused_field
  final IconData iconData;
  UserDetailsCard({
    super.key,
    required this.titleOfTheCard,
    required this.contentForTitleCard,
    required this.iconData,
  });

  @override
  State<UserDetailsCard> createState() => _UserDetailsCardState();
}

class _UserDetailsCardState extends State<UserDetailsCard> {
  @override
  final userData = user;

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kMainWhite,
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(2, 2), blurRadius: 2),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(kMainPadding),
        child: Row(
          children: [
            Icon(widget.iconData, size: 30),
            const SizedBox(width: 10),
            Text("${widget.titleOfTheCard} : ${widget.contentForTitleCard}"),
          ],
        ),
      ),
    );
  }
}
