import 'package:mobi_health_care_app/models/medicine_model.dart';

class User {
  final String userName;
  final String userId;
  final String userGender;
  final int age;
  final String userDescription;
  final int totalDaysTookMedicine;
  final int remainindDaysForTreatment;

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
  });
}
