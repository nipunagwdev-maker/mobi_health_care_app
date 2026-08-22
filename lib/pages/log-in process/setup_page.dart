import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/data/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/pages/log-in%20process/main_navigation.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  String selectedGender = "";

  //method for gender selecting
  Widget _genderButton(String gender) {
    bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? kMainWhite : kMainWhite.withAlpha(30),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          gender,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? kMainColor : kMainWhite,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Future<void> saveProfileAndContinue() async {
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        pinController.text.length != 4) {
      return; // simple guard: name, age, and a real 4-digit PIN are required
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('userName', nameController.text);
    await prefs.setInt('userAge', int.tryParse(ageController.text) ?? 0);
    await prefs.setString('userLocation', locationController.text);
    await prefs.setString('userPhone', phoneController.text);
    await prefs.setString('userPin', pinController.text);
    await prefs.setString('userGender', selectedGender);
    await prefs.setBool('hasCompletedSetup', true);

    await loadUserFromPrefs(); // added later

    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainNavigation()),
      (route) => false, // clears the setup screens from history
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainColor,
      child: Scaffold(
        backgroundColor: kMainWhite.withAlpha(180),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Let's get to know you",
                    style: TextStyle(
                      color: kMainColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildField(
                    "Full Name",
                    nameController,
                    TextInputType.text,
                    hint: "Eg : Saman Kumara",
                  ),
                  const SizedBox(height: kMainPadding),
                  _buildField(
                    "Age",
                    ageController,
                    TextInputType.number,
                    hint: "Eg : 35",
                  ),
                  const SizedBox(height: kMainPadding),
                  _buildField(
                    "Location",
                    locationController,
                    TextInputType.text,
                    hint: "Eg : Ambalangoda, Galle",
                  ),
                  const SizedBox(height: kMainPadding),

                  //adding gender selecting feature to the user as an input
                  Text(
                    "Gender",
                    style: TextStyle(
                      color: kMainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: _genderButton("Male")),
                          const SizedBox(width: kMainPadding * 1.5),
                          Expanded(child: _genderButton("Female")),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: kMainPadding),

                  _buildField(
                    "Phone Number",
                    phoneController,
                    TextInputType.phone,
                    hint: "Eg : 0761178865",
                  ),
                  const SizedBox(height: kMainPadding),
                  _buildField(
                    "Create 4-digit PIN",
                    pinController,
                    TextInputType.number,
                    isPin: true,
                    hint: "Eg : 5124",
                  ),
                  const SizedBox(height: kMainPadding * 3),

                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: ElevatedButton(
                        onPressed: saveProfileAndContinue,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kMainWhite.withAlpha(200),
                          foregroundColor: kMainColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller,
    TextInputType type, {
    String hint = " ",
    bool isPin = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: kMainColor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: type,
          maxLength: isPin ? 4 : null,
          obscureText: isPin,
          style: TextStyle(color: kMainColor),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: kMainColor.withAlpha(100)),
            counterText: "",
            filled: true,
            fillColor: kMainWhite.withAlpha(125),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
