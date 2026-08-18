//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/data/user_data.dart';
import 'package:mobi_health_care_app/widgets/profile_page_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int get total => user.medicineList.length;
  int get taken => user.medicineList
      .where((medicine) => medicine.successfullyDrinked)
      .length;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(color: kMainColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kMainWhite,
                    ),
                    child: Icon(Icons.person, size: 100, color: kMainColor),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Nipuna Madhuranga",
                    style: TextStyle(
                      color: kMainWhite,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        //age of the user
                        "Emergency +94761178865",
                        style: TextStyle(
                          fontSize: 12,
                          color: kMainWhite,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(width: 10),

                      Text(
                        " | ",
                        style: TextStyle(
                          fontSize: 12,
                          color: kMainWhite,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 10),

                      //gender of the user
                      Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 12,
                          color: kMainWhite,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(kMainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfilePageCard(
                        profileCardTitleName: "STREAK",
                        profileCardValue: 05,
                      ),
                      ProfilePageCard(
                        profileCardTitleName: "MEDICINES",
                        profileCardValue: total,
                      ),
                      ProfilePageCard(
                        profileCardTitleName: "AGE",
                        profileCardValue: 23,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Health Profile",
                    style: TextStyle(
                      fontSize: 16,
                      color: kMainColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
