import 'package:care_companion/widgets/exercise_logs/exercise_log_list.dart';
import 'package:care_companion/widgets/exercise_logs/new_exercise_log.dart';
import 'package:flutter/material.dart';

import 'exercise_log_model.dart';

class ExerciseLog extends StatefulWidget {
  const ExerciseLog({super.key});

  @override
  State<ExerciseLog> createState() {
    return _ExerciseLogsState();
  }
}

class _ExerciseLogsState extends State<ExerciseLog> {
  final List<ExerciseData> _registeredLogs = List.empty(growable: true);

  void _openAddLogOverlay() {
    showModalBottomSheet(

      isDismissible: true,
      showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExerciseLog(onAddLog: _addLog),
    );
  }

  void _addLog(ExerciseData data) {
    setState(() {
      _registeredLogs.add(data);
    });
  }

  void _removeLog(ExerciseData data) {
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
      child: Text('No Exercise Logs found. Start adding some!'),
    );

    if (_registeredLogs.isNotEmpty) {
      mainContent = ExerciseLogList(
        exerciseLogs: _registeredLogs,
        onRemoveLog: _removeLog,
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Exercise Logs'),

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
