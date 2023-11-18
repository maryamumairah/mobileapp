import 'course.dart';

List<Course> courseList = []; // Make sure to initialize this list with existing courses

bool hasOverlap(Course newCourse) {
  for (Course existingCourse in courseList) {
    if (existingCourse.day1 == newCourse.day1 ||
        existingCourse.day1 == newCourse.day2 ||
        existingCourse.day2 == newCourse.day1 ||
        existingCourse.day2 == newCourse.day2) {
      if (existingCourse.time1 == newCourse.time1 ||
          existingCourse.time1 == newCourse.time2 ||
          existingCourse.time2 == newCourse.time1 ||
          existingCourse.time2 == newCourse.time2) {
        return true; // Overlapping day and time
      }
    }
  }
  return false;
}
