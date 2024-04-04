import 'package:flutter/material.dart';

void main() {
  runApp(ReminderApp());
}

class ReminderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReminderScreen(),
    );
  }
}

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  String _selectedDay = 'Monday';
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedActivity = 'Wake UP';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButtonFormField<String>(
              value: _selectedDay,
              onChanged: (newValue) {
                setState(() {
                  _selectedDay = newValue!;
                });
              },
              items: <String>[
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday',
                'Sunday',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Day',
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Select Time'),
              trailing: Text('${_selectedTime.hour}:${_selectedTime.minute}'),
              onTap: _selectTime,
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedActivity,
              onChanged: (newValue) {
                setState(() {
                  _selectedActivity = newValue!;
                });
              },
              items: <String>[
                'Wake UP',
                'Go to Gym',
                'BreakFast',
                'Meetings',
                'Lunch',
                'QuickNap',
                'Go to Library',
                'Dinner',
                'Go to sleep',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Activity',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Reminder Set:');
                print('Day: $_selectedDay');
                print('Time: ${_selectedTime.hour}:${_selectedTime.minute}');
                print('Activity: $_selectedActivity');
              },
              child: Text('Set Reminder'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }
}

