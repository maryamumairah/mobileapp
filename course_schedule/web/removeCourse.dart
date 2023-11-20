void removeCourse(List<Map<String, String>> courseList, dynamic course2Remove) {
  bool courseExists =
      courseList.any((course) => course['course2Remove'] == course2Remove);

  if (courseExists) {
    courseList
        .removeWhere((course) => course['course2Remove'] == course2Remove);
    print('Course $course2Remove removed from the schedule.');
    print('Updated courses: $courseList');
  } else {
    print('Error: Course $course2Remove not found in the schedule.');
  }
}
