import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';

class MedicineItemCard extends StatelessWidget {
  final String medicineName;
  final String medicineDose;
  final bool isCompleted;
  final VoidCallback onTapCheck;
  const MedicineItemCard({
    super.key,
    required this.medicineName,
    required this.medicineDose,
    required this.isCompleted,
    required this.onTapCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kMainWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kSecondaryColor.withAlpha(075), width: 0.25),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(1, 2),
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(kMainPadding),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: kwidghtBgColor.withAlpha(035),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kMainPadding),
                child: Image.asset(
                  "assets/images/pill.png",
                  fit: BoxFit.cover,
                  width: 35,
                ),
              ),
            ),
          ),

          //medicine name and dose mentioning here
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //you need to change the medicine name later according to the list
                Text(
                  // ignore: unnecessary_string_interpolations
                  "$medicineName",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: kMainBlack,
                  ),
                ),

                const SizedBox(height: 4),

                //dose of the medicine, you need to change this later according to the mediList.
                Text(
                  // ignore: unnecessary_string_interpolations
                  "$medicineDose",
                  style: TextStyle(
                    fontSize: 12,
                    color: kwidghtBgColor,
                    fontWeight: FontWeight.w900,
                  ),
                  //when it's a big name, it's showing really good way  with "pritio..." like this
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: kMainPadding * 1.75),
            child: Material(
              child: InkWell(
                onTap: onTapCheck,
                child: Container(
                  height: 32.5,
                  width: 32.5,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? kSecondaryColor
                        : kwidghtBgColor.withAlpha(030),
                    border: Border.all(color: kSecondaryColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    CupertinoIcons.check_mark,
                    fontWeight: FontWeight.w900,
                    size: 16,
                    color: isCompleted ? kMainWhite : kwidghtBgColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
