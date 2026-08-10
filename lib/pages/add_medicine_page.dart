import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/models/medicine_model.dart';
import 'package:mobi_health_care_app/models/user_model.dart';
import 'package:mobi_health_care_app/data/user_data.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  //make two controllers to handle the user inputs for the medicine name and the dose
  final TextEditingController nameController = TextEditingController();
  final TextEditingController doseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kMainColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(color: kMainColor),
              child: Padding(
                padding: const EdgeInsets.all(kMainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Text(
                      "Add Medication",
                      style: TextStyle(
                        color: kMainWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "Enter medicatin details below ",
                      style: TextStyle(
                        fontSize: 12,
                        color: kMainWhite,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: kMainPadding),

            Padding(
              padding: const EdgeInsets.all(kMainPadding),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: kMainWhite,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(1, 2),
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(kMainPadding * 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "MEDICINE NAME",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: Colors.black54,
                            ),
                          ),

                          const SizedBox(height: 5),

                          //text adding field
                          //user going to add it's medicine name here
                          TextField(
                            controller: nameController,
                            //hint text desings
                            decoration: InputDecoration(
                              hintText: "e.g. Melformin",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: kwidghtBgColor.withAlpha(150),
                              ),

                              //box design
                              filled: true,
                              fillColor: kwidghtBgColor.withAlpha(040),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: kMainPadding,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(
                                  color: kSecondaryColor,
                                  width: 1.5,
                                ),
                              ),
                              //focusColor: kMainBlack.withAlpha(050)
                            ),
                            //input text design
                            style: TextStyle(
                              fontSize: 15,
                              color: kMainBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 15),

                          Text(
                            "MEDICINE DOSE",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: Colors.black54,
                            ),
                          ),

                          const SizedBox(height: 5),

                          //does section
                          TextField(
                            controller: doseController,
                            //hint text desings
                            decoration: InputDecoration(
                              hintText: "e.g. 2 tablets after dinner",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: kwidghtBgColor.withAlpha(150),
                              ),

                              //box design
                              filled: true,
                              fillColor: kwidghtBgColor.withAlpha(040),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: kMainPadding,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(
                                  color: kSecondaryColor,
                                  width: 1.5,
                                ),
                              ),
                              //focusColor: kMainBlack.withAlpha(050)
                            ),
                            //input text design
                            style: TextStyle(
                              fontSize: 15,
                              color: kMainBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 20),

                          //make the text filed inputs accessable
                          //need to check again
                          ElevatedButton(
                            onPressed: () {
                              String name = nameController.text;
                              String dose = doseController.text;

                              if (name.isEmpty || dose.isEmpty) {
                                return; //stop here, since nothing entered.
                              }

                              setState(() {
                                user.medicineList.add(
                                  Medicine(
                                    medicineName: name,
                                    medicineDose: dose,
                                    successfullyDrinked: false,
                                    medicineId: user.medicineList.length,
                                  ),
                                );
                              });
                              nameController.clear();
                              doseController.clear();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Save  Medicine",
                              style: TextStyle(color: kMainRedColor),
                            ),
                          ),
                        ],
                      ),
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
