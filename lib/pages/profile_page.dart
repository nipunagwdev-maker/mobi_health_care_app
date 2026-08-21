//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/data/user_data.dart';
import 'package:mobi_health_care_app/widgets/profile_page_card.dart';
import 'package:mobi_health_care_app/widgets/user_details_card.dart';

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
  final userData = user;

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
                    // ignore: unnecessary_string_interpolations
                    "${userData.userName}",
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
                        "userID : ${userData.userId}",
                        style: TextStyle(
                          fontSize: 13.5,
                          color: kMainWhite,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(width: 10),

                      Text(
                        " | ",
                        style: TextStyle(
                          fontSize: 13.5,
                          color: kMainWhite,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 10),

                      //gender of the user
                      Text(
                        userData.userGender,
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

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMainPadding),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: kMainPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfilePageCard(
                            profileCardTitleName: "MEDICINES",
                            profileCardValue: total,
                          ),
                          ProfilePageCard(
                            profileCardTitleName: "AGE",
                            profileCardValue: userData.age,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "User Details",
                        style: TextStyle(
                          fontSize: 18,
                          color: kMainColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: kMainPadding),

                      //widget for profile page
                      UserDetailsCard(
                        titleOfTheCard: "Full Name",
                        contentForTitleCard: userData.userName,
                        iconData: Icons.person,
                      ),
                      const SizedBox(height: 10),

                      UserDetailsCard(
                        titleOfTheCard: "Location",
                        contentForTitleCard: userData.userAddress,
                        iconData: Icons.home_filled,
                      ),
                      const SizedBox(height: 10),

                      UserDetailsCard(
                        titleOfTheCard: "Gender",
                        contentForTitleCard: userData.userGender,
                        iconData: Icons.female,
                      ),
                      const SizedBox(height: 10),

                      UserDetailsCard(
                        titleOfTheCard: "Age",
                        contentForTitleCard: userData.age.toString(),
                        iconData: Icons.calendar_month,
                      ),
                      const SizedBox(height: 10),

                      UserDetailsCard(
                        titleOfTheCard: "User-ID",
                        contentForTitleCard: userData.userId,
                        iconData: Icons.person,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
