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
      medicineName: "Aspirin",
      medicineDose: "1 tablet every morning",
      successfullyDrinked: true,
      medicineId: 6,
    ),

    Medicine(
      medicineName: "Omeprazole",
      medicineDose: "1 capsule before breakfast",
      successfullyDrinked: false,
      medicineId: 7,
    ),
    Medicine(
      medicineName: "Ibuprofen",
      medicineDose: "1 tablet after lunch",
      successfullyDrinked: false,
      medicineId: 5,
    ),

    Medicine(
      medicineName: "Aspirin",
      medicineDose: "1 tablet every morning",
      successfullyDrinked: true,
      medicineId: 6,
    ),
  ],
);
