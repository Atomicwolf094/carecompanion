import 'package:care_companion/widgets/vital_logs/vital_log_model.dart';
import 'package:flutter/material.dart';

class VitalLogItem extends StatelessWidget {
  const VitalLogItem(this.data, {super.key});

  final VitalData data;

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
                    'Blood Pressure: ${data.systolic}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Pulse: ${data.pulse}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Oxygen: ${data.oxygen}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Temperature: ${data.temprature}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
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
