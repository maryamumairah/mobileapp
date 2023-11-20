import 'dart:html';
import 'addcourse.dart';
import 'editCourse.dart';
import 'viewCourse/view_schedule.dart' as course_lib;
import 'dart:convert';

// create list to store the courseCode, day1, time1, day2, time2
List<Map<String, String>> courseList = [];

void main() {
  List<course_lib.Course> weeklySchedule = [
    course_lib.Course('Math101', 'Monday', '8.30-9.50', 'Wednesday', '8.30-9.50'),
    course_lib.Course('Physics202', 'Tuesday', '10.00-11.20', 'Thursday', '10.00-11.20'),
  ];
   // connect to the HTML elements using querySelector method 
  InputElement courseCodeInput = querySelector('#courseCode') as InputElement;
  SelectElement day1Input = querySelector('#day1') as SelectElement; 
  InputElement time1Input = querySelector('#time1') as InputElement;
  SelectElement day2Input = querySelector('#day2') as SelectElement;
  InputElement time2Input = querySelector('#time2') as InputElement;
  ButtonElement addButton = querySelector('#addCourse') as ButtonElement;
  ButtonElement editButton = querySelector('#editCourse') as ButtonElement;
  ButtonElement viewScheduleButton = querySelector('#viewSchedule') as ButtonElement;


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
