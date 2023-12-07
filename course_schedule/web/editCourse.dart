import 'dart:html';
import 'overlap.dart';

List<Map<String, String>> editCourse(List<Map<String, String>> courseList, String courseCode, String day1, String time1, String day2, String time2) {
  Map<String, String> newCourse = {
    'courseCode':courseCode,
    'day1': day1, 
    'time1': time1,
    'day2': day2,
    'time2': time2,
  };

  //Check if the course already exists in the list and store it in courseExists
  bool courseExists = courseList.any((course) => course['courseCode'] == courseCode);

  DivElement messageDiv = querySelector('#message') as DivElement; 
  if (courseExists) { 
    // Check if the updated course has an overlap with any existing course
    if (!hasOverlap(courseList, newCourse, day1, time1, day2, time2)) {
      // If there's no overlap, update the course

      for (Map<String, String> courseListTemp in courseList) { 
        if (courseListTemp['courseCode'] == courseCode) {
          courseListTemp['day1'] = day1;
          courseListTemp['time1'] = time1;
          courseListTemp['day2'] = day2;
          courseListTemp['time2'] = time2;
          courseListTemp = newCourse;

          break;
        }
      }

      messageDiv.text = 'Course updated successfully.';
      messageDiv.style.color = 'green';
    } else {
      // If there's an overlap, print an error message
      messageDiv.text = 'Error: The updated course overlaps with an existing course. Please check the course times again.';
      messageDiv.style.color = 'red';
    }
  } else {
    messageDiv.text = 'Error: Course $courseCode does not exist in the schedule. Please check the course code again.';
    messageDiv.style.color = 'red';
  }

  return courseList;
}
