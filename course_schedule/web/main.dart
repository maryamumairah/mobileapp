import 'dart:html';

// create list to store the courseCode, day1, time1, day2, time2
List<Course> courseList = [];

void main(){
  // connect to the HTML elements using querySelector method 
  InputElement courseCodeInput = querySelector('#courseCode') as InputElement;
  SelectElement day1Input = querySelector('#day1') as SelectElement;
  SelectElement time1Input = querySelector('#time1') as SelectElement;
  SelectElement day2Input = querySelector('#day2') as SelectElement;
  SelectElement time2Input = querySelector('#time2') as SelectElement;
  ButtonElement addButton = querySelector('#addCourse') as ButtonElement;
}

class Course {
  String courseCode;
  String day1;
  String time1;
  String day2;
  String time2;

  Course(this.courseCode, this.day1, this.time1, this.day2, this.time2);

  @override
  String toString() {
    return 'Course: $courseCode, Schedule: $day1 $time1, $day2 $time2';
  }
}


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

void addCourse(String courseCode, String day1, String time1, String day2, String time2) {
  Course newCourse = Course(courseCode, day1, time1, day2, time2);

  // Check if the course already exists in the list
  bool courseExists = courseList.any((course) => course.courseCode == courseCode);

  if (!courseExists) {
    // Check if the course has less than two time slots and no overlap
    if (courseList.where((course) => course.courseCode == courseCode).length < 2 && !hasOverlap(newCourse)) {
      // Add the new course to the list
      courseList.add(newCourse);
      print('Course $courseCode added to the schedule.');
    } else {
      print('Error: Course $courseCode already scheduled for two days or there is an overlap.');
    }
  } else {
    print('Error: Course $courseCode already exists in the schedule.');
  }

  for (Course course in courseList) {
    print(course);
  }
}


