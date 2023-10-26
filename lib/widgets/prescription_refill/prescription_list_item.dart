import 'package:care_companion/widgets/prescription_refill/prescription_model.dart';
import 'package:flutter/material.dart';

class PrescriptionItem extends StatelessWidget {
  const PrescriptionItem(this.data, {super.key});

  final PrescriptionData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Medicine Name: ${data.medicineName}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Dosage: ${data.dosage}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Quantity: ${data.qty}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            /*Text(
              'Time: ${data.time}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 5,),*/
            Text(
              'When: ${data.formattedDate}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            /*const SizedBox(
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
            ),*/
          ],
        ),
      ),
    );
  }
}
