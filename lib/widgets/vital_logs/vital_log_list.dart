import 'package:care_companion/widgets/vital_logs/vital_log_list_item.dart';
import 'package:care_companion/widgets/vital_logs/vital_log_model.dart';
import 'package:flutter/material.dart';


class VitalLogList extends StatelessWidget {
  const VitalLogList({
    super.key,
    required this.vitalLogs,
    required this.onRemoveLog,
  });

  final List<VitalData> vitalLogs;
  final void Function(VitalData data) onRemoveLog;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vitalLogs.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(vitalLogs[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveLog(vitalLogs[index]);
        },
        child: VitalLogItem(
          vitalLogs[index],
        ),
      ),
    );
  }
}
