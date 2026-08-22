import 'package:mobi_health_care_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

User user = User(
  userName: "",
  userId: "u0001",
  userGender: "",
  age: 0,
  userAddress: "",
  userDescription: "",
  totalDaysTookMedicine: 0,
  remainindDaysForTreatment: 30,
  medicineList: [],
);

Future<void> loadUserFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();

  user.userName = prefs.getString('userName') ?? "";
  user.age = prefs.getInt('userAge') ?? 0;
  user.userAddress = prefs.getString('userLocation') ?? "";
  user.userGender = prefs.getString('userGender') ?? "";
}
