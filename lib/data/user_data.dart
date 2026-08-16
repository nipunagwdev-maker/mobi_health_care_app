import 'package:mobi_health_care_app/models/medicine_model.dart';
import 'package:mobi_health_care_app/models/user_model.dart';

User user = User(
  userName: "P.Thushaniga",
  userId: "a0001",
  userGender: "Male",
  age: 40,
  userDescription: "Sample User Description Showing here",
  totalDaysTookMedicine: 0,
  remainindDaysForTreatment: 30,
  medicineList: [
    Medicine(
      medicineName: "Paracetamol",
      medicineDose: "2 tablets after meals",
      successfullyDrinked: false,
      medicineId: 0,
    ),

    Medicine(
      medicineName: "Vitamin C",
      medicineDose: "1 tablet after breakfast",
      successfullyDrinked: false,
      medicineId: 1,
    ),

    Medicine(
      medicineName: "Amoxicillin",
      medicineDose: "1 capsule every 8 hours",
      successfullyDrinked: false,
      medicineId: 2,
    ),
  ],
);
