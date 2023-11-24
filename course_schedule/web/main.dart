import 'dart:html';
import 'addcourse.dart';
import 'editcourse.dart';
import 'removecourse.dart';

// create list to store the courseCode, day1, time1, day2, time2
List<Map<String, String>> courseList = [];

/*to test functions, open this message and change any 'courseList' to 'courseArray'
List<Map<String, String>> courseArray = [
  {'courseCode': 'CS101', 'courseName': 'Computer Science 101'},
  {'courseCode': 'MATH101', 'courseName': 'Mathematics 101'},
  {'courseCode': 'PHY101', 'courseName': 'Physics 101'},
  {'courseCode': 'CS201', 'courseName': 'Computer Science 201'},
];*/

void main() {
  // connect to the HTML elements using querySelector method
  InputElement courseCodeInput = querySelector('#courseCode') as InputElement;
  SelectElement day1Input = querySelector('#day1') as SelectElement;
  SelectElement time1Input = querySelector('#time1') as SelectElement;
  SelectElement day2Input = querySelector('#day2') as SelectElement;
  SelectElement time2Input = querySelector('#time2') as SelectElement;
  ButtonElement addButton = querySelector('#addCourse') as ButtonElement;
  ButtonElement editButton = querySelector('#editCourse') as ButtonElement;
  ButtonElement removeButton = querySelector('#confirmRemove') as ButtonElement;
  InputElement course2RemoveInput =
      querySelector('#course2Remove') as InputElement;

  editButton.onClick.listen((event) {
    String courseCode = courseCodeInput.value!;
    String day1 = day1Input.selectedOptions[0].value;
    String time1 = time1Input.selectedOptions[0].value;
    String day2 = day2Input.selectedOptions[0].value;
    String time2 = time2Input.selectedOptions[0].value;

    courseList = editCourse(courseList, courseCode, day1, time1, day2, time2);
  });

  addButton.onClick.listen((event) {
    print('Button clicked');
    String courseCode = courseCodeInput.value!;
    String day1 = day1Input.selectedOptions[0].value;
    String time1 = time1Input.selectedOptions[0].value;
    String day2 = day2Input.selectedOptions[0].value;
    String time2 = time2Input.selectedOptions[0].value;

    courseList = addCourse(courseCode, day1, time1, day2, time2);
  });

  removeButton.onClick.listen((event) {
    event.preventDefault();
    String course2Remove = course2RemoveInput.value!;

    courseList = removeCourse(courseList, course2Remove);
  });
}
