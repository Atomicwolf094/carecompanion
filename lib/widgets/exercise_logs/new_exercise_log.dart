import 'package:care_companion/constants/colors.dart';
import 'package:care_companion/widgets/exercise_logs/exercise_log_model.dart';
import 'package:flutter/material.dart';


class NewExerciseLog extends StatefulWidget {
  const NewExerciseLog({super.key, required this.onAddLog});

  final void Function(ExerciseData data) onAddLog;

  @override
  State<NewExerciseLog> createState() {
    return _NewExerciseLogState();
  }
}

class _NewExerciseLogState extends State<NewExerciseLog> {
  final _hrsOfSleep = TextEditingController();
  final _caloriesBurned = TextEditingController();
  final _whatExercise = TextEditingController();
  final _sets = TextEditingController();
  final _reps = TextEditingController();
  final _notes = TextEditingController();
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
      ExerciseData(
          hrsOfSleep: _hrsOfSleep.text,
          caloriesBurned: _caloriesBurned.text,
          whatExercises: _whatExercise.text,
          sets: _sets.text,
          reps: _reps.text,
          notes: _notes.text,
          date: _selectedDate!,
          time: _selectedTime),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _hrsOfSleep.dispose();
    _caloriesBurned.dispose();
    _whatExercise.dispose();
    _sets.dispose();
    _reps.dispose();
    _notes.dispose();
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
              controller: _hrsOfSleep,
              decoration: const InputDecoration(
                label: Text('Hours of sleep'),
              ),
            ),
            TextField(
              controller: _caloriesBurned,
              decoration: const InputDecoration(
                label: Text('Calories burned'),
              ),
            ),
            TextField(
              controller: _whatExercise,
              decoration: const InputDecoration(
                label: Text('What exercises'),
              ),
            ),
            TextField(
              controller: _sets,
              decoration: const InputDecoration(
                label: Text('Sets'),
              ),
            ),
            TextField(
              controller: _reps,
              decoration: const InputDecoration(
                label: Text('Reps'),
              ),
            ),
            TextField(
              controller: _notes,
              decoration: const InputDecoration(
                label: Text('Notes'),
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
