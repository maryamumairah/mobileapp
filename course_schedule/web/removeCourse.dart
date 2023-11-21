import 'dart:html';

List<Map<String, String>> removeCourse(
    List<Map<String, String>> courseList, String course2Remove) {
  bool courseExists =
      courseList.any((course) => course['course2Remove'] == course2Remove);

  DivElement alertDiv = querySelector('#removeAlert') as DivElement;

  if (courseExists) {
    courseList
        .removeWhere((course) => course['course2Remove'] == course2Remove);
    alertDiv.text =
        'Course $course2Remove removed from the schedule. Update courses: $courseList';
  } else {
    alertDiv.text = 'Error: Course $course2Remove not found in the schedule.';
  }

  return courseList;
}
