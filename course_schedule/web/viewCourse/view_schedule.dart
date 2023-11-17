import 'dart:html';

class Course {
  String courseCode;
  String day;
  String time;

  Course(this.courseCode, this.day, this.time);
}

void main() {
  List<Course> weeklySchedule = [
    Course('Math101', 'Monday', '8.30-9.50'),
    Course('Physics202', 'Tuesday', '8.30-9.50'),
  ];

  updateScheduleTable(weeklySchedule);
}

void updateScheduleTable(List<Course> weeklySchedule) {
  weeklySchedule.forEach((course){
    String cellId = '${course.day.toLowerCase()}-${course.time.replaceAll('.', '\\.')}';
    
    TableCellElement dateCell = querySelector('#$cellId') as TableCellElement;
    
    dateCell.innerText = course.courseCode;
  });
}