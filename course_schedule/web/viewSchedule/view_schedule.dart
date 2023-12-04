import 'dart:html';
import 'dart:convert';

class Course {
  String courseCode;
  String day1;
  String time1;
  String day2;
  String time2;

  Course(this.courseCode, this.day1, this.time1, this.day2, this.time2);

  factory Course.fromMap(Map<String, String> map) {
    return Course(
      map['courseCode'] ?? '',
      map['day1'] ?? '',
      map['time1'] ?? '',
      map['day2'] ?? '',
      map['time2'] ?? '',
    );
  }
}

void main() {
  Map<String, String> queryParams = Uri.splitQueryString(window.location.href);
 
  // Retrieve the encoded list from the query parameters
  String? encodedSchedule = queryParams['http://127.0.0.1:8080/viewSchedule/viewSchedule.html?schedule'];

  // Decode the list
  List<dynamic> scheduleAsMaps = jsonDecode(encodedSchedule!);

  // Convert the list of maps back to a list of Course objects
  List<Course> weeklySchedule = scheduleAsMaps
      .map((map) => Course(
            map['courseCode'] ?? '',
            map['day1'] ?? '',
            map['time1'] ?? '',
            map['day2'] ?? '',
            map['time2'] ?? '',
          ))
      .toList();

  updateScheduleTable(weeklySchedule);
}

void updateScheduleTable(List<Course> weeklySchedule) {
  var cells = document.querySelectorAll('td');

  cells.forEach((cell) {
    if(cell.id != 'time-display'){
      cell.innerText = '';
    }
  });

  weeklySchedule.forEach((course) {
    String cellId1 = '${course.day1.toLowerCase()}-${course.time1.replaceAll(':', '-')}';
    String cellId2 = '${course.day2.toLowerCase()}-${course.time2.replaceAll(':', '-')}';

    TableCellElement dateCell1 = querySelector('#$cellId1') as TableCellElement;
    TableCellElement dateCell2 = querySelector('#$cellId2') as TableCellElement;

    dateCell1.innerText = course.courseCode;
    dateCell2.innerText = course.courseCode;

    dateCell1.style.backgroundColor = '#DFF2FF';
    dateCell2.style.backgroundColor = '#DFF2FF';
  });
}