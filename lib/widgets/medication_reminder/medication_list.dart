import 'package:care_companion/widgets/medication_reminder/medication_list_item.dart';
import 'package:care_companion/widgets/medication_reminder/medication_model.dart';
import 'package:flutter/material.dart';


class MedicationList extends StatelessWidget {
  const MedicationList({
    super.key,
    required this.medications,
    required this.onRemoveLog,
  });

  final List<MedicationData> medications;
  final void Function(MedicationData data) onRemoveLog;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: medications.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(medications[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveLog(medications[index]);
        },
        child: MedicineItem(
          medications[index],
        ),
      ),
    );
  }
}
