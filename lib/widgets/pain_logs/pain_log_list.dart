import 'package:care_companion/widgets/pain_logs/pain_log_list_item.dart';
import 'package:care_companion/widgets/pain_logs/pain_log_model.dart';
import 'package:flutter/material.dart';


class PainLogList extends StatelessWidget {
  const PainLogList({
    super.key,
    required this.painLogs,
    required this.onRemoveLog,
  });

  final List<PainData> painLogs;
  final void Function(PainData data) onRemoveLog;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: painLogs.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(painLogs[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveLog(painLogs[index]);
        },
        child: PainLogItem(
          painLogs[index],
        ),
      ),
    );
  }
}
