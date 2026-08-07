import 'package:mobi_health_care_app/models/medicine_model.dart';

class MedicineData {
  final List<Medicine> medicineList = [
    Medicine(
      medicineName: "Paracetamol",
      medicineDose: "2 tablets after meals",
      successfullyDrinked: false,
      medicineId: 0,
    ),

    Medicine(
      medicineName: "Vitamin C",
      medicineDose: "1 tablet after breakfast",
      successfullyDrinked: true,
      medicineId: 1,
    ),

    Medicine(
      medicineName: "Amoxicillin",
      medicineDose: "1 capsule every 8 hours",
      successfullyDrinked: false,
      medicineId: 2,
    ),

    Medicine(
      medicineName: "Cetirizine",
      medicineDose: "1 tablet before bedtime",
      successfullyDrinked: false,
      medicineId: 3,
    ),

    Medicine(
      medicineName: "Metformin",
      medicineDose: "1 tablet after dinner",
      successfullyDrinked: true,
      medicineId: 4,
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

    Medicine(
      medicineName: "Omeprazole",
      medicineDose: "1 capsule before breakfast",
      successfullyDrinked: false,
      medicineId: 7,
    ),
  ];
}
