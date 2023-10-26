import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMMMd();

const uuid = Uuid();

class MedicationData {
  MedicationData({
    required this.medicineName,
    required this.dosage,
    required this.date,
    required this.time
  }) : id = uuid.v4();

  final String id;
  final String medicineName;
  final String dosage;
  final DateTime date;
  final String time;

  String get formattedDate {
    return dateFormatter.format(date);
  }

}
