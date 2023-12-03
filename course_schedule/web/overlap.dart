bool hasOverlap(List<Map<String, String>> courseList, Map<String, String> newCourse, String day1, String time1, String day2, String time2) {
  for (Map<String, String> existingCourse in courseList) {
    if (existingCourse['courseCode'] == newCourse['courseCode']) {
      if ((existingCourse['day1'] == newCourse['day1'] || existingCourse['day2'] == newCourse['day2']) &&
          (existingCourse['time1'] == newCourse['time1'] || existingCourse['time2'] == newCourse['time2'])) {
        return true; // Overlapping day and time
      }
    }
  }
  return false;
}


bool hasOverlapWithExisting(List<Map<String, String>> courseList, String courseCode, String day1, String time1, String day2, String time2) {
  for (Map<String, String> existingCourse in courseList) {
    if (existingCourse['day1'] == day1 ||
        existingCourse['day1'] == day2 ||
        existingCourse['day2'] == day1 ||
        existingCourse['day2'] == day2) {
      if (existingCourse['time1'] == time1 ||
          existingCourse['time1'] == time2 ||
          existingCourse['time2'] == time1 ||
          existingCourse['time2'] == time2) {
        return true; // Overlapping day and time
      }
    }
  }
  return false;
}
