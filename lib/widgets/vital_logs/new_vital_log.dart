import 'package:care_companion/constants/colors.dart';
import 'package:care_companion/widgets/vital_logs/vital_log_model.dart';
import 'package:flutter/material.dart';


class NewVitalLog extends StatefulWidget {
  const NewVitalLog({super.key, required this.onAddLog});

  final void Function(VitalData data) onAddLog;

  @override
  State<NewVitalLog> createState() {
    return _NewVitalLogState();
  }
}

class _NewVitalLogState extends State<NewVitalLog> {
  final _diastolic = TextEditingController();
  final _systolic = TextEditingController();
  final _pulse = TextEditingController();
  final _oxygen = TextEditingController();
  final _temprature = TextEditingController();
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
    /*final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }*/

    widget.onAddLog(
      VitalData(
          systolic: _systolic.text,
          diastolic: _diastolic.text,
          temprature: _temprature.text,
          oxygen: _oxygen.text,
          pulse: _pulse.text,
          date: _selectedDate!,
          time: _selectedTime),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _systolic.dispose();
    _diastolic.dispose();
    _temprature.dispose();
    _oxygen.dispose();
    _pulse.dispose();
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
              controller: _systolic,
              decoration: const InputDecoration(
                label: Text('Blood Pressure'),
              ),
            ),
            TextField(
              controller: _pulse,
              decoration: const InputDecoration(
                label: Text('Pulse'),
              ),
            ),
            TextField(
              controller: _oxygen,
              decoration: const InputDecoration(
                label: Text('Oxygen'),
              ),
            ),
            TextField(
              controller: _temprature,
              decoration: const InputDecoration(
                label: Text('Temprature'),
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
