import 'dart:html';

List<Map<String, String>> removeCourse(List<Map<String, String>> courseList, String course2Remove){
  bool courseExist = courseList.any((course) => course['courseCode'] == course2Remove);

  if (courseExist) {
    courseList.removeWhere((course) => course['courseCode'] == course2Remove);
    String keyValuePairs = '';

    courseList.forEach((course) {
      course.forEach((key, value) {
        keyValuePairs += '$key: $value\n';
      });
    });

    document.getElementById('alertR')!.innerText = 'Course $course2Remove removed\n $keyValuePairs';
  } else {
    document.getElementById('alertR')!.innerText = 'Course $course2Remove not found';
  }
  return courseList;
}
