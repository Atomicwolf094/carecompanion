import 'package:care_companion/widgets/prescription_refill/prescription_list_item.dart';
import 'package:care_companion/widgets/prescription_refill/prescription_model.dart';
import 'package:flutter/material.dart';


class PrescriptionList extends StatelessWidget {
  const PrescriptionList({
    super.key,
    required this.prescriptions,
    required this.onRemoveLog,
  });

  final List<PrescriptionData> prescriptions;
  final void Function(PrescriptionData data) onRemoveLog;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: prescriptions.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(prescriptions[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveLog(prescriptions[index]);
        },
        child: PrescriptionItem(
          prescriptions[index],
        ),
      ),
    );
  }
}
