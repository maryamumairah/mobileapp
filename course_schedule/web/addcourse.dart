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
    if (courseList.where((course) => course['courseCode'] == courseCode).length < 2) {
      // Add the new course to the list
      courseList.add(newCourse);
      messageDiv.text = 'Course $courseCode added to the schedule on $day1 at $time1 and $day2 at $time2.';
      messageDiv.style.color = 'green';
    }
   if (day1 == day2 && time1 == time2 || hasOverlapWithExisting(courseList, courseCode, day1, time1, day2, time2)) {
      messageDiv.text = 'Error: The course overlaps with an existing course/day/time. Please check again.';
    } else {
      courseList.add(newCourse);
      if (courseList.length == 1) {
        messageDiv.text = 'Course $courseCode successfully added. You have 1 course in your schedule.';
      } else {
        messageDiv.text = 'Course $courseCode successfully added. You have ${courseList.length} courses in your schedule.';
      }
    }
  } else {
    messageDiv.text = 'Error: You have exceeded the maximum number of courses allowed in your schedule.';
    messageDiv.style.color = 'red';
  }
  return courseList;
}
