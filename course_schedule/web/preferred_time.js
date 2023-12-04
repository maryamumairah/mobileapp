const preferedTimeButton1 = document.querySelector('#time1')
const preferedTimeButton2 = document.querySelector('#time2')
const messageElement1 = document.querySelector('#error-message-one')
const messageElement2 = document.querySelector('#error-message-two')

// This is an event listener called on the input when the time has changed
preferedTimeButton1.addEventListener('change', (e) => {
  e.preventDefault(); // stops the page from refreshing
  // Passing input value and <p> tag for error message
  preferedTime(preferedTimeButton1.value, messageElement1) // Parameters of type String and element
})

preferedTimeButton2.addEventListener('change', (e) => {
  e.preventDefault();
  preferedTime(preferedTimeButton2.value, messageElement2)
})

// This is the function that checks the input value and displays the error message
function preferedTime(startTime, messageElement) {
  if (
    startTime !== '08:30' &&
    startTime !== '10:00' &&
    startTime !== '11:30' &&
    startTime !== '14:00' &&
    startTime !== '15:30'
  ) {
    messageElement.innerHTML = "Error: Session time is only allowable for 08:30am, 10:00am, 11:30am, 02:00pm, and 03:30pm";
  } else {
    messageElement.innerHTML = "Session time is allowable";
  }
}