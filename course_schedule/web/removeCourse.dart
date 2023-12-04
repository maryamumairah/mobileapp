import 'dart:html';

List<Map<String, String>> removeCourse(
    List<Map<String, String>> courseList, String course2Remove) {
  bool courseExist =
      courseList.any((course) => course['courseCode'] == course2Remove);

  if (courseExist) {
    courseList.removeWhere((course) => course['courseCode'] == course2Remove);

    document.getElementById('message')!.innerText =
        'Course $course2Remove removed from schedule';
    document.getElementById('message')!.style.color = 'green';
  } else {
    document.getElementById('message')!.innerText =
        'Error: Course $course2Remove not found in schedule';
    document.getElementById('message')!.style.color = 'red';
  }
  return courseList;
}
