import 'dart:html';
import 'course.dart';
import 'viewCourse/view_schedule.dart' as course_lib;
import 'dart:convert';


// create list to store the courseCode, day1, time1, day2, time2
void main(){
  List<course_lib.Course> weeklySchedule = [
    course_lib.Course('Math101', 'Monday', '8.30-9.50', 'Wednesday', '8.30-9.50'),
    course_lib.Course('Physics202', 'Tuesday', '10.00-11.20', 'Thursday', '10.00-11.20'),
  ];


  // connect to the HTML elements using querySelector method 
  InputElement courseCodeInput = querySelector('#courseCode') as InputElement;
  SelectElement day1Input = querySelector('#day1') as SelectElement;
  SelectElement time1Input = querySelector('#time1') as SelectElement;
  SelectElement day2Input = querySelector('#day2') as SelectElement;
  SelectElement time2Input = querySelector('#time2') as SelectElement;
  ButtonElement addButton = querySelector('#addCourse') as ButtonElement;
  ButtonElement viewScheduleButton = querySelector('#viewSchedule') as ButtonElement;

  viewScheduleButton.onClick.listen((MouseEvent event){
    // Convert the list to a list of maps
  List<Map<String, String>> scheduleAsMaps = weeklySchedule.map((course) => course.toMap()).toList();

  // Encode the list of maps
  String encodedSchedule = jsonEncode(scheduleAsMaps);

  // Construct the URL with the encoded list as a query parameter
  String url = 'viewCourse/viewCourse.html?schedule=$encodedSchedule';

  // Navigate to the second page
  window.location.href = url;
  });

}
