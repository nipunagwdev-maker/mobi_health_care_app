import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/data/user_data.dart';

class UserDetailsCard extends StatefulWidget {
  final String titleOfTheCard;
  final String contentForTitleCard;
  // ignore: unused_field
  final IconData iconData;
  const UserDetailsCard({
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
  // ignore: override_on_non_overriding_member
  final userData = user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
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
            Icon(widget.iconData, size: 25, color: kMainColor),
            const SizedBox(width: 10),
            Text(
              "${widget.titleOfTheCard} : ${widget.contentForTitleCard}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
