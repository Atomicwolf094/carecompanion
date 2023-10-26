import 'package:care_companion/constants/colors.dart';
import 'package:care_companion/widgets/medication_reminder/medication_model.dart';
import 'package:flutter/material.dart';


class NewMedication extends StatefulWidget {
  const NewMedication({super.key, required this.onAddLog});

  final void Function(MedicationData data) onAddLog;

  @override
  State<NewMedication> createState() {
    return _NewMedicationState();
  }
}

class _NewMedicationState extends State<NewMedication> {
  final _medName = TextEditingController();
  final _dosage = TextEditingController();
  DateTime? _selectedDate;
  String _selectedTime = 'No time selected';

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate, 
      lastDate: DateTime(now.year+1),
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
      MedicationData(
          medicineName: _medName.text,
          dosage: _dosage.text,
          date: _selectedDate!,
          time: _selectedTime),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _medName.dispose();
    _dosage.dispose();
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
              controller: _medName,
              decoration: const InputDecoration(
                label: Text('Medicine Name'),
              ),
            ),
            TextField(
              controller: _dosage,
              decoration: const InputDecoration(
                label: Text('Dosage'),
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
