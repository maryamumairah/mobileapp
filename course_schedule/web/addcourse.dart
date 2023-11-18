// create a list to store the courseCode, day1, time1, day2, time2
List<Map<String, String>> courseList = [];

void addCourse(String courseCode, String day1, String time1, String day2, String time2) {
  Map<String, String> newCourseMap = {
    'courseCode': courseCode,
    'day1': day1,
    'time1': time1,
    'day2': day2,
    'time2': time2,
  };

  // Check if the course already exists in the list
  bool courseExists = courseList.any((course) => course['courseCode'] == courseCode);

  if (!courseExists) {
    // Check if the course has less than two time slots
    if (courseList.where((course) => course['courseCode'] == courseCode).length < 2) {
      // Add the new course to the list
      courseList.add(newCourseMap);
      print('Course $courseCode added to the schedule on $day1 at $time1 and $day2 at $time2.');
    } else {
      print('Error: Course $courseCode already scheduled for two days.');
    }
  } else {
    print('Error: Course $courseCode already exists in the schedule.');
  }

}
