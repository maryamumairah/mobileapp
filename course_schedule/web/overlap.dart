bool hasOverlap(List<Map<String, String>> courseList, Map<String, String> newCourse) {
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