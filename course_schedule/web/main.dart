import 'dart:html';
import 'addcourse.dart';
import 'course.dart';

// create list to store the courseCode, day1, time1, day2, time2
List<Map<String, String>> courseList = [];

void main() {
  // connect to the HTML elements using querySelector method
  InputElement courseCodeInput = querySelector('#courseCode') as InputElement;
  SelectElement day1Input = querySelector('#day1') as SelectElement;
  SelectElement time1Input = querySelector('#time1') as SelectElement;
  SelectElement day2Input = querySelector('#day2') as SelectElement;
  SelectElement time2Input = querySelector('#time2') as SelectElement;
  ButtonElement addButton = querySelector('#addCourse') as ButtonElement;

  // Event listeners for buttons in the HTML file
  addButton.onClick.listen((event) {
    print('Button clicked');

    String courseCode = courseCodeInput.value!;
    String day1 = day1Input.selectedOptions[0].value;
    String time1 = time1Input.selectedOptions[0].value;
    String day2 = day2Input.selectedOptions[0].value;
    String time2 = time2Input.selectedOptions[0].value;

    courseList = addCourse(courseCode, day1, time1, day2, time2);
  });

}
