import 'package:care_companion/widgets/medication_reminder/medication_list.dart';
import 'package:care_companion/widgets/medication_reminder/medication_model.dart';
import 'package:care_companion/widgets/medication_reminder/new_medication.dart';
import 'package:flutter/material.dart';

class Medication extends StatefulWidget {
  const Medication({super.key});

  @override
  State<Medication> createState() {
    return _MedicationState();
  }
}

class _MedicationState extends State<Medication> {
  final List<MedicationData> _registeredLogs = List.empty(growable: true);

  void _openAddLogOverlay() {
    showModalBottomSheet(

      isDismissible: true,
      showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewMedication(onAddLog: _addLog),
    );
  }

  void _addLog(MedicationData data) {
    setState(() {
      _registeredLogs.add(data);
    });
  }

  void _removeLog(MedicationData data) {
    final index = _registeredLogs.indexOf(data);
    setState(() {
      _registeredLogs.remove(data);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Log deleted.'),
        action: SnackBarAction(
          textColor: Colors.amber,
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredLogs.insert(index, data);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Medicine Reminders found. Start adding some!'),
    );

    if (_registeredLogs.isNotEmpty) {
      mainContent = MedicationList(
        medications: _registeredLogs,
        onRemoveLog: _removeLog,
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Medicine Reminder'),

        ),
        body: Column(
          children: [
            Expanded(
              child: mainContent,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _openAddLogOverlay,
          tooltip: 'Add Log',
          child: const Icon(Icons.add),
        ));
  }
}
