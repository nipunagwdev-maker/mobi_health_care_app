import 'package:mobi_health_care_app/models/medicine_model.dart';

class User {
  String userName;
  String userId;
  String userGender;
  String userAddress;
  int age;
  String userDescription;
  int totalDaysTookMedicine;
  int remainindDaysForTreatment;

  final List<Medicine> medicineList;

  User({
    required this.userName,
    required this.userId,
    required this.userGender,
    required this.age,
    required this.userDescription,
    required this.totalDaysTookMedicine,
    required this.remainindDaysForTreatment,
    required this.medicineList,
    required this.userAddress,
  });
}
