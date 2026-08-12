import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/data/medicine_data.dart';
import 'package:mobi_health_care_app/data/user_data.dart';

// ignore: must_be_immutable
class MedicineCard extends StatefulWidget {
  //int total = 10;
  //int numberOfDrinkedMedicines = 0;

  // ignore: prefer_const_constructors_in_immutables
  MedicineCard({super.key});

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  //calculate the ttla medicines they took.
  int get total => user.medicineList.length;
  int get taken => user.medicineList
      .where((medicine) => medicine.successfullyDrinked)
      .length;

  //user data
  final userData = user;

  //medicine list
  final medicineList = MedicineData().medicineList;

  @override
  Widget build(BuildContext context) {
    //how many medicine taken
    //update in way that matcing for later calculations
    double progressValue = taken == 0 ? 0 : taken / total;
    //double progressValue = (taken / total).toDouble();

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
                  "${taken.toString()}/ ${total.toString()} taken",
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
