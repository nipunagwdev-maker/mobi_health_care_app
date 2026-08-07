import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';

class MedicineItemCard extends StatefulWidget {
  const MedicineItemCard({super.key});

  @override
  State<MedicineItemCard> createState() => _MedicineItemCardState();
}

class _MedicineItemCardState extends State<MedicineItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: kMainWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kSecondaryColor.withAlpha(175)),
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
          Column(
            children: [
              Text(
                "Metformin",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
