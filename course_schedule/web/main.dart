import 'dart:html';
import 'addcourse.dart';
import 'editCourse.dart';

// create list to store the courseCode, day1, time1, day2, time2
List<Map<String, String>> courseList = [];

void main() {
   // connect to the HTML elements using querySelector method 
  InputElement courseCodeInput = querySelector('#courseCode') as InputElement;
  SelectElement day1Input = querySelector('#day1') as SelectElement; 
  InputElement time1Input = querySelector('#time1') as InputElement;
  SelectElement day2Input = querySelector('#day2') as SelectElement;
  InputElement time2Input = querySelector('#time2') as InputElement;
  ButtonElement addButton = querySelector('#addCourse') as ButtonElement;
  ButtonElement editButton = querySelector('#editCourse') as ButtonElement;

  // Event listeners for buttons in the HTML file
  addButton.onClick.listen((event) {
    print('addCourse button clicked');

    String courseCode = courseCodeInput.value!;
    String day1 = day1Input.selectedOptions[0].value;
    String time1 = time1Input.value!;
    String day2 = day2Input.selectedOptions[0].value;
    String time2 = time2Input.value!;

    courseList = addCourse(courseCode, day1, time1, day2, time2);

  });
  
  editButton.onClick.listen((event){
    print('editCourse button clicked');
    
    String courseCode = courseCodeInput.value!;
    String day1 = day1Input.selectedOptions[0].value;
    String time1 = time1Input.value!;
    String day2 = day2Input.selectedOptions[0].value;
    String time2 = time2Input.value!;

    courseList = editCourse(courseList, courseCode, day1, time1, day2, time2);
    
    print('in main.dart, courseList: $courseList');
  });

}
