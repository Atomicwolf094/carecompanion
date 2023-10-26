import 'package:care_companion/widgets/pain_logs/pain_log_model.dart';
import 'package:flutter/material.dart';

class PainLogItem extends StatelessWidget {
  const PainLogItem(this.data, {super.key});

  final PainData data;

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
            Text(
              'Scale: ${data.scale}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Pain descriptor: ${data.painDesc}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Cause: ${data.cause}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 5,),
            Text(
              'Symptom: ${data.symptom}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Medication: ${data.medication}',
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
