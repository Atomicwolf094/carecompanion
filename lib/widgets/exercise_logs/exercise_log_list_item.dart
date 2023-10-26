import 'package:care_companion/widgets/exercise_logs/exercise_log_model.dart';
import 'package:flutter/material.dart';

class ExerciseLogItem extends StatelessWidget {
  const ExerciseLogItem(this.data, {super.key});

  final ExerciseData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hours of Sleep: ${data.hrsOfSleep}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    'Calories burned: ${data.caloriesBurned}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Exercises: ${data.whatExercises}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Sets: ${data.sets}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(width: 5,),
                Expanded(
                  child: Text(
                    'Reps: ${data.reps}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Notes: ${data.notes}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Spacer(),
                Row(
                  children: [
                    Text(data.formattedDate,
                        style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(width: 4),
                    Text(data.time,
                        style: Theme.of(context).textTheme.labelMedium)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
