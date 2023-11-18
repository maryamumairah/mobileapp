import 'dart:html';
import 'course.dart';
import 'editCourse.dart';

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
  ButtonElement editButton = querySelector('#editCourse') as ButtonElement;

  editButton.onClick.listen((event){
    //call editCourse function from editCourse.dart by passing courseCode
    String courseCode = courseCodeInput.value!; //get the value of courseCode input 
    editCourse(courseCode); //call editCourse function from editCourse.dart by passing courseCode
  });

}
