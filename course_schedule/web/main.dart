import 'dart:html';
import 'course.dart';

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
  ButtonElement viewScheduleButton = querySelector('#viewSchedule') as ButtonElement;

  viewScheduleButton.onClick.listen((MouseEvent event){
    window.location.href = 'viewCourse/viewCourse.html';
  });

}
