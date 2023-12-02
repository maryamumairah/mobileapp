import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Date Time Dropdown'),
        ),
        body: Center(
          child: DateTimePickerDropdown(),
        ),
      ),
    );
  }
}

class DateTimePickerDropdown extends StatefulWidget {
  @override
  _DateTimePickerDropdownState createState() => _DateTimePickerDropdownState();
}

class _DateTimePickerDropdownState extends State<DateTimePickerDropdown> {
  List<DateTime> dateTimeValues = [
    DateTime(2023, 11, 17, 8, 30),
    DateTime(2023, 11, 17, 10, 0),
    DateTime(2023, 11, 17, 11, 30),
    DateTime(2023, 11, 17, 14, 0),
    DateTime(2023, 11, 17, 15, 30),
  ];
  String selectedStartTime = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton<DateTime>(
          value: selectedStartTime.isEmpty
              ? null
              : dateTimeValues
                  .firstWhere((dt) => dt.toString() == selectedStartTime),
          onChanged: (DateTime? newValue) {
            setState(() {
              selectedStartTime = newValue!.toString();
            });
          },
          items:
              dateTimeValues.map<DropdownMenuItem<DateTime>>((DateTime value) {
            return DropdownMenuItem<DateTime>(
              value: value,
              child: Text(DateFormat('h:mm a').format(value)),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  String getSelectedTime() {
    return selectedStartTime;
  }
}
 /*
        String getSelectedTime(){
          return selectedStartTime; 
        }
        //kat mana nak letak getter ni
        DateTime startTime = DateTime.parse(getSelectedTime()),
        DateTime endTime = startTime.add(const Duration(hours: 1, minutes: 20));
        print('Course Start Time: ${DateFormat('h:mm a').format(startTime)}');
        print('Course End Time: ${DateFormat('h:mm a').format(endTime)}');*/