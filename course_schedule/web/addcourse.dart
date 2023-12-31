import 'dart:html';
import 'overlap.dart';
// import 'main.dart';

// Create a list to store the courseCode, day1, time1, day2, time2
List<Map<String, String>> courseList = [];

// Get the messageDiv element once
DivElement messageDiv = querySelector('#message') as DivElement;

// List<Map<String, String>> addCourse(String courseCode, String day1, String time1, String day2, String time2) {

List<Map<String, String>> addCourse(String courseCode, String day1, String time1, String day2, String time2) {
  Map<String, String> newCourse = {
    'courseCode': courseCode,
    'day1': day1,
    'time1': time1,
    'day2': day2,
    'time2': time2,
  };

  // Check if the course already exists in the list
  bool courseExists = courseList.any((course) => course['courseCode'] == courseCode);
  DivElement messageDiv = querySelector('#message') as DivElement;
    
  if (!courseExists) {
    // Check if the course has less than two time slots
   if (day1 == day2 && time1 == time2 || hasOverlapWithExisting(courseList, courseCode, day1, time1, day2, time2)) {
      messageDiv.text = 'Error: The course overlaps with an existing course/day/time. Please check again.';
      messageDiv.style.color = 'red';
    } else {
      courseList.add(newCourse);
      if (courseList.length == 1) {
        messageDiv.text = 'Course $courseCode successfully added. You have 1 course in your schedule.';
        messageDiv.style.color = 'green';
      } else {
        messageDiv.text = 'Course $courseCode successfully added. You have ${courseList.length} courses in your schedule.';
        messageDiv.style.color = 'green';
      }
    }
  } else {
    messageDiv.text = 'Error: You have exceeded the maximum number of courses allowed in your schedule.';
    messageDiv.style.color = 'red';
  }
  return courseList;
}
