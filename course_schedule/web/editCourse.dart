import 'dart:html';
import 'course.dart';
import 'overlap.dart';
import 'addCourse.dart';

void editCourse(String courseCode, String newDay1, String newTime1, String newDay2, String newTime2) {

  Course newCourseList = Course(courseCode, newDay1, newTime1, newDay2, newTime2); //newCourseList is a new object of Course class with the updated values

  // Check if the course already exists in the list
  Course? courseExist;
  for (Course courseMapNew in newCourseMap) {
    if (courseMapNew.courseCode == courseCode) {
      courseExist = courseMapNew;
      break;
    }
  }

  DivElement messageDiv = querySelector('#message') as DivElement;

  if (courseExist != null) {
      // Check if the updated course has an overlap with any existing course
      if (!hasOverlap(newCourseList)) { //pass the new inputs to hasOverlap function which is newDay1, newTime1, newDay2, newTime2
        // If there's no overlap, update the course
        courseExist.day1 = newDay1;
        courseExist.time1 = newTime1;
        courseExist.day2 = newDay2;
        courseExist.time2 = newTime2;

        messageDiv.text = 'Course updated successfully.';
      } else {
        // If there's an overlap, print an error message
        messageDiv.text = 'Error: The updated course overlaps with an existing course. Please check the course times again.';
      }
  } else {
    messageDiv.text = 'Error: Course $courseCode does not exist in the schedule. Please check the course code again.';
  }
}