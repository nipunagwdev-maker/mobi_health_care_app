import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/data/medicine_data.dart';
import 'package:mobi_health_care_app/data/user_data.dart';

import 'package:flutter/cupertino.dart';

class MedicineCard extends StatefulWidget {
  int totalNumberOfMedicines;
  int numberOfDrinkedMedicines;

  MedicineCard({
    super.key,
    required this.totalNumberOfMedicines,

    required this.numberOfDrinkedMedicines,
  });

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  var total = user.medicineList.length;
  //user data
  final userData = user;

  //medicine list
  final medicineList = MedicineData().medicineList;

  @override
  Widget build(BuildContext context) {
    //how many medicine taken
    //update in way that matcing for later calculations
    double progressValue =
        (widget.numberOfDrinkedMedicines / widget.totalNumberOfMedicines)
            .toDouble();

    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: kMainWhite.withAlpha(020),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 0.8, color: kMainWhite.withAlpha(100)),

        /*boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            offset: Offset(0, 2),
            spreadRadius: 0.3,
          ),
          
        ],*/
      ),
      child: Padding(
        padding: const EdgeInsets.all(kMainPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Progress",
                  style: TextStyle(
                    fontSize: 12.5,
                    color: kMainWhite,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                //taken amount need to calculate and put here
                //but for now, we just gonna add it as hardcode
                Text(
                  "${widget.numberOfDrinkedMedicines.toString()}/ ${widget.totalNumberOfMedicines.toString()} taken",
                  style: TextStyle(
                    fontSize: 12.5,
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            //indicator line
            LinearProgressIndicator(
              value: progressValue,
              backgroundColor: kMainWhite.withAlpha(120),
              valueColor: AlwaysStoppedAnimation(kSecondaryColor),
              minHeight: 5,
              borderRadius: BorderRadius.circular(50),
            ),

            const SizedBox(height: 10),
            Text(
              "2 medications remaining today",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: kMainWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
