import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const List<String> time = <String>[
  "2020-03-20 08:30:00.000",
  "2020-03-20 10:00:00.000",
  "2020-03-20 11:30:00.000",
  "2020-03-20 14:00:00.000",
  "2020-03-20 15:30:00.000",
];

void main() => runApp(const DropdownMenuApp());

class DropdownMenuApp extends StatelessWidget {
  const DropdownMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Times for Course Schedule')),
        body: const Center(
          child: DropdownMenuTime(),
        ),
      ),
    );
  }
}

class DropdownMenuTime extends StatefulWidget {
  const DropdownMenuTime({super.key});

  @override
  State<DropdownMenuTime> createState() => _DropdownMenuTimeState();
}

class _DropdownMenuTimeState extends State<DropdownMenuTime> {
  String startTime = time.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: time.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          startTime = value!;
          setTime(startTime);
        });
      },
      dropdownMenuEntries: time.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

void setTime(String startTime) {
  DateTime start =
      DateTime.parse(startTime); // convert start string to date time
  print(DateFormat('h:mm a').format(start)); //display time only

  DateTime end = start.add(const Duration(hours: 1, minutes: 20)); //set endTime
  print(DateFormat('h:mm a').format(end)); //display time only
}
