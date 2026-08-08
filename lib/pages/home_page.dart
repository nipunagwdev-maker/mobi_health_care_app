import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/data/medicine_data.dart';
import 'package:mobi_health_care_app/data/user_data.dart';
import 'package:mobi_health_care_app/models/medicine_model.dart';
import 'package:mobi_health_care_app/widgets/date_card_main.dart';
import 'package:mobi_health_care_app/widgets/medicine_card.dart';
import 'package:mobi_health_care_app/widgets/medicine_item_card.dart';
//import 'package:mobi_health_care_app/widgets/medicine_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //date formatting
  final DateFormat formetter = DateFormat('EEEE, MMMM');
  final DateFormat dayFormat = DateFormat('dd');
  final DateFormat date = DateFormat('EEEE');

  //user data
  final userData = user;

  //medicine list
  final medicineList = MedicineData().medicineList;

  @override
  Widget build(BuildContext context) {
    //use the built date and time here
    DateTime currentTime = DateTime.now();
    String formetterDate = formetter.format(currentTime).toUpperCase();
    String formatterDay = dayFormat.format(currentTime).toUpperCase();

    DateTime today = DateTime.now();
    String newFormatterDate = date.format(today);

    //a list about that days counting widget

    List<DateTime> dates = List.generate(
      5,
      (index) => today.add(Duration(days: index - 2)),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 290,
              color: kMainColor,
              child: Padding(
                padding: const EdgeInsets.all(kMainPadding * 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Good Morning,",
                          style: TextStyle(color: kMainWhite),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: kMainWhite.withAlpha(100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.notifications, color: kMainColor),
                        ),
                      ],
                    ),

                    Text(
                      user.userName,
                      style: TextStyle(
                        color: kMainWhite,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20),

                    //premade medicine card widget, that shows the process
                    Expanded(
                      child: MedicineCard(
                        numberOfDrinkedMedicines: 5,
                        totalNumberOfMedicines: 10,
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            //going to make list veiw here
            //horizontal scrollable
            Padding(
              padding: const EdgeInsets.all(kMainPadding),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    DateTime date = dates[index];
                    bool isToday =
                        date.year == today.year &&
                        date.month == today.month &&
                        date.day == today.day;

                    return DateCardMain(
                      dayName: DateFormat('EEE').format(date).toUpperCase(),
                      dayValue: DateFormat('dd').format(date),
                      isToday: isToday,
                      //dayValue: date.day.toString(),
                    );
                  },
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(kMainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        //vertical: kMainPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today's Medications",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                              fontSize: 12,
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //list widgets i'm gonna make

                    //make a list veiw  for medicines
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: userData.medicineList.length,
                      itemBuilder: (context, index) {
                        Medicine mediListBlock = userData.medicineList[index];
                        return MedicineItemCard(
                          medicineName: mediListBlock.medicineName,
                          medicineDose: mediListBlock.medicineDose,
                          isCompleted: mediListBlock.successfullyDrinked,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
