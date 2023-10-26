import 'package:care_companion/constants/colors.dart';
import 'package:care_companion/widgets/pain_logs/pain_log_model.dart';
import 'package:flutter/material.dart';


class NewPainLog extends StatefulWidget {
  const NewPainLog({super.key, required this.onAddLog});

  final void Function(PainData data) onAddLog;

  @override
  State<NewPainLog> createState() {
    return _NewPainLogState();
  }
}

class _NewPainLogState extends State<NewPainLog> {
  final _scale = TextEditingController();
  final _painDesc = TextEditingController();
  final _cause = TextEditingController();
  final _symptom = TextEditingController();
  final _medication = TextEditingController();
  DateTime? _selectedDate;
  String _selectedTime = 'No time selected';

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _presentTimePicker() async {
    final now = TimeOfDay.now();
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: now,
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = '${pickedTime.hour}:${pickedTime.minute}';
      });
    }
  }

  void _submitData() {
    widget.onAddLog(
      PainData(
          scale: _scale.text,
          painDesc: _painDesc.text,
          cause: _cause.text,
          symptom: _symptom.text,
          medication: _medication.text,
          date: _selectedDate!,
          time: _selectedTime),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _scale.dispose();
    _painDesc.dispose();
    _cause.dispose();
    _symptom.dispose();
    _medication.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: _presentDatePicker,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          _selectedDate == null
                              ? 'No date selected'
                              : dateFormatter.format(_selectedDate!),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: _presentTimePicker,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.access_time,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          _selectedTime,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _scale,
              decoration: const InputDecoration(
                label: Text('Scale    (0-10)'),
              ),
            ),
            TextField(
              controller: _painDesc,
              decoration: const InputDecoration(
                label: Text('Pain descriptor'),
              ),
            ),
            TextField(
              controller: _cause,
              decoration: const InputDecoration(
                label: Text('Cause'),
              ),
            ),
            TextField(
              controller: _symptom,
              decoration: const InputDecoration(
                label: Text('Symptom'),
              ),
            ),
            TextField(
              controller: _medication,
              decoration: const InputDecoration(
                label: Text('Medication'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeColor
                  ),
                  onPressed: _submitData,
                  child: const Text('Save'),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
