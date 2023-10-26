import 'package:care_companion/widgets/prescription_refill/new_prescription.dart';
import 'package:care_companion/widgets/prescription_refill/prescription_list.dart';
import 'package:care_companion/widgets/prescription_refill/prescription_model.dart';
import 'package:flutter/material.dart';

class Prescription extends StatefulWidget {
  const Prescription({super.key});

  @override
  State<Prescription> createState() {
    return _PrescriptionState();
  }
}

class _PrescriptionState extends State<Prescription> {
  final List<PrescriptionData> _registeredLogs = List.empty(growable: true);

  void _openAddLogOverlay() {
    showModalBottomSheet(

      isDismissible: true,
      showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewPrescription(onAddLog: _addLog),
    );
  }

  void _addLog(PrescriptionData data) {
    setState(() {
      _registeredLogs.add(data);
    });
  }

  void _removeLog(PrescriptionData data) {
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
      child: Text('No Prescriptions found. Start adding some!'),
    );

    if (_registeredLogs.isNotEmpty) {
      mainContent = PrescriptionList(
        prescriptions: _registeredLogs,
        onRemoveLog: _removeLog,
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Prescription Refill'),

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
