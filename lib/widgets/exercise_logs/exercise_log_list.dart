import 'package:care_companion/widgets/exercise_logs/exercise_log_model.dart';
import 'package:flutter/material.dart';

import 'exercise_log_list_item.dart';


class ExerciseLogList extends StatelessWidget {
  const ExerciseLogList({
    super.key,
    required this.exerciseLogs,
    required this.onRemoveLog,
  });

  final List<ExerciseData> exerciseLogs;
  final void Function(ExerciseData data) onRemoveLog;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exerciseLogs.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(exerciseLogs[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveLog(exerciseLogs[index]);
        },
        child: ExerciseLogItem(
          exerciseLogs[index],
        ),
      ),
    );
  }
}
