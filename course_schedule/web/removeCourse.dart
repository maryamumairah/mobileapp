import 'dart:html';

List<Map<String, String>> removeCourse(List<Map<String, String>> courseList, String course2Remove){
  bool courseExist = courseList.any((course) => course['courseCode'] == course2Remove);

  if (courseExist) {
    courseList.removeWhere((course) => course['courseCode'] == course2Remove);

    document.getElementById('alertR')!.innerText = 'Course $course2Remove removed';
  } else {
    document.getElementById('alertR')!.innerText = 'Course $course2Remove not found';
  }
  return courseList;
}
