import 'package:care_companion/widgets/pain_logs/new_pain_log.dart';
import 'package:care_companion/widgets/pain_logs/pain_log_list.dart';
import 'package:care_companion/widgets/pain_logs/pain_log_model.dart';
import 'package:flutter/material.dart';

class PainLog extends StatefulWidget {
  const PainLog({super.key});

  @override
  State<PainLog> createState() {
    return _PainLogsState();
  }
}

class _PainLogsState extends State<PainLog> {
  final List<PainData> _registeredLogs = List.empty(growable: true);

  void _openAddLogOverlay() {
    showModalBottomSheet(

      isDismissible: true,
      showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewPainLog(onAddLog: _addLog),
    );
  }

  void _addLog(PainData data) {
    setState(() {
      _registeredLogs.add(data);
    });
  }

  void _removeLog(PainData data) {
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
      child: Text('No Pain Logs found. Start adding some!'),
    );

    if (_registeredLogs.isNotEmpty) {
      mainContent = PainLogList(
        painLogs: _registeredLogs,
        onRemoveLog: _removeLog,
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Pain Logs'),

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
