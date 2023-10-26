import 'package:care_companion/widgets/vital_logs/new_vital_log.dart';
import 'package:care_companion/widgets/vital_logs/vital_log_list.dart';
import 'package:care_companion/widgets/vital_logs/vital_log_model.dart';
import 'package:flutter/material.dart';

class VitalLogs extends StatefulWidget {
  const VitalLogs({super.key});

  @override
  State<VitalLogs> createState() {
    return _VitalLogsState();
  }
}

class _VitalLogsState extends State<VitalLogs> {
  final List<VitalData> _registeredLogs = List.empty(growable: true);

  void _openAddLogOverlay() {
    showModalBottomSheet(

      isDismissible: true,
      showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewVitalLog(onAddLog: _addLog),
    );
  }

  void _addLog(VitalData data) {
    setState(() {
      _registeredLogs.add(data);
    });
  }

  void _removeLog(VitalData data) {
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
      child: Text('No Vital Logs found. Start adding some!'),
    );

    if (_registeredLogs.isNotEmpty) {
      mainContent = VitalLogList(
        vitalLogs: _registeredLogs,
        onRemoveLog: _removeLog,
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Vitals Logs'),

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
