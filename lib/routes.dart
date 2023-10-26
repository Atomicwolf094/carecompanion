import 'package:care_companion/widgets/exercise_logs/exercise_log_screen.dart';
import 'package:care_companion/widgets/landing_screen.dart';
import 'package:care_companion/widgets/pain_logs/pain_log_screen.dart';
import 'package:care_companion/widgets/vital_logs/vital_log_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/medication_reminder/medication_screen.dart';
import 'widgets/prescription_refill/prescription_screen.dart';

class Routes {
  Routes._();

  static const String landingPageScreen = '/landingPageScreen';
  static const String vitalLogScreen = '/vitalLogScreen';
  static const String painLogScreen = '/painLogScreen';
  static const String exerciseLogScreen = '/exerciseLogScreen';
  static const String medicineReminderScreen = '/medicineReminderScreen';
  static const String prescriptionRefillScreen = '/prescriptionRefillScreen';

  static final routes = <String, WidgetBuilder>{
    landingPageScreen: (context) => const LandingScreen(),
    vitalLogScreen: (context) => const VitalLogs(),
    painLogScreen: (context) => const PainLog(),
    exerciseLogScreen: (context) => const ExerciseLog(),
    medicineReminderScreen: (context) => const Medication(),
    prescriptionRefillScreen: (context) => const Prescription(),
  };
}
