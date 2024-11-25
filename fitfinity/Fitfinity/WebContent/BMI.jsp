<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>BMI Calculator</title>
      <style>
    @import url("https://fonts.googleapis.com/css2?family=Nunito:wght@600;700;800;900&display=swap");
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
body {
  min-height: 20vh;
  background: linear-gradient(to right, #0bb288, #dcdcdc);
  font-family: "Nunito", sans-serif;
}
.container {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}

.box {
  min-width: 600px;
  min-height: 600px;
  background: rgb(250, 250, 250);
  border-radius: 38px;
  text-align: center;
  position: relative;
  margin-bottom: 0px;
}
.box::before {
  content: "";
  position: absolute;
  height: 110%;
  width: 110%;
  left: -5%;
  top: -5%;
  background-color: rgba(255, 255, 255, 0.3);
  box-shadow: 0px 0px 166px -31px rgba(0, 0, 0, 0.15);
  border-radius: 60px;
  z-index: -1;
}


      h1 {
        color: #0bb288;
        text-align: center;
        font-size: 36px;
      }

      /* Add a transition effect */
      input[type="number"] {
        transition: all 0.5s ease-out;
        width: 300px;
        padding: 10px;
        font-size: 18px;
        border-radius: 5px;
        border: 1px solid #0bb288;
        margin-bottom: 20px;
      }

      input[type="number"]:focus {
        outline: none;
        box-shadow: 0 0 10px #0bb288;
      }

      select {
        transition: all 0.5s ease-out;
        width: 300px;
        padding: 10px;
        font-size: 18px;
        border-radius: 5px;
        border: 1px solid #0bb288;
        margin-bottom: 20px;
      }

      select:focus {
        outline: none;
        box-shadow: 0 0 10px #0bb288;
      }

      input[type="reset"],
      input[type="submit"] {
        transition: all 0.5s ease-out;
        background-color: #0bb288;
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        border: none;
        font-size: 18px;
        cursor: pointer;
        margin-right: 10px;
      }

      input[type="reset"]:hover,
      input[type="submit"]:hover {
        background-color: white;
        color: #0bb288;
        box-shadow: 0 0 10px #0bb288;
      }
      #progress-bar {
  width: 50%;
  height: 20px;
  background-color: rgb(230, 230, 230);
  border-radius: 25px;
  margin: auto;
}

#progress {
  height: 100%;
  background-color: #a16d63;
  border-radius: 25px;
  transition: width 0.75s linear;
}
 .dot {
    width: 10px;
    height: 10px;
    background-color: #0bb288;
    border-radius: 50%;
    position: absolute;
  }
  .dot1 {
    top: 30px;
    left: 30px;
  }
  .dot2 {
    bottom: 30px;
    right: 30px;
    top: 30px;
  }
  .dot3 {
    bottom: 30px;
    right: 30px;
  }
  .dot4 {
    bottom: 30px;
    left: 30px;
  }

  a:hover{
    color: #0bb288;
    box-shadow: 1px 1px 10px rgb(214, 210, 210);
  }
</style>
  <body>
    <div class="container">
      <div class="box">
        <div class="dot dot1"></div>
          <div class="dot dot2"></div>
             <div class="dot dot3"></div>
               <div class="dot dot4"></div>
        <br>
        <h1>BMI Calculator</h1>
        <p style="text-align: center; margin-bottom: 20px;"><a target="_blank" style="text-decoration: none; font-size: 20px; color:#a16d63 !important;" href="https://www.rapidtables.com/convert/length/feet-to-cm.html">For unit converter-> click here</a></p>
        <div id="progress-bar">
    <div id="progress"></div></div>

        <br>
        <form id="bmi-form" action="#">
          <p>
            <label for="weight">Weight (kg):</label>
            <input style="border-radius: 16px;" type="number" id="weight" name="weight" min="30" max="200" step=".01" required oninput="completeTask()">
            <span class="error" id="weight-error"></span>
          </p>
          <p>
            <label for="height">Height (cm):</label>
            <input style="border-radius: 16px;" type="number" id="height" min="60" max="250" step=".01" required oninput="completeTask()">
            <span class="error" id="height-error"></span>
          </p>
          <p>
            <label for="age">Age (years):</label>
            <input style="border-radius: 16px;" type="number" id="age" name="age" min="1" max="120" required oninput="completeTask()">
            <span class="error" id="age-error"></span>
          </p>
          <p>
            <label for="gender">Gender:</label>
            <select style="border-radius: 16px; margin-left: 30px;" id="gender" name="gender" required oninput="completeTask()">
              <option value="" selected>Select Gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
            </select>
          </p>
          <p>
            <label for="activity-level">Activity: </label>
            <select style="border-radius: 16px; margin-left: 30px;" id="activity-level" name="activity-level" required oninput="completeTask()">
              <option value="" selected>Select Activity Level</option>
              <option value="sedentary">Sedentary (little or no exercise)</option>
              <option value="lightly-active">Lightly Active (light exercise 1-3 days/week)</option>
              <option value="moderately-active">Moderately Active (moderate exercise 3-5 days/week)</option>
              <option value="very-active">Very Active (hard exercise 6-7 days/week)</option>
              <option value="extra-active">Extra Active (very hard exercise, physical job, or training twice a day)</option>
            </select>
          </p>
          <br>
          <p>
            <input type="reset" value="Reset">
            <input type="submit" value="Calculate BMI" onclick="calculateBMI()">
          </p>
        </form> 
        <button id="hidden-button" style="display: none" onclick="completeTask()">Complete Task</button>
        <br>
        <div id="result"></div>
        <br>
        <div id="calorie-result">  
        </div>
      </div>
    </div>
    <script> 
      const inputWeight = document.getElementById("weight");
inputWeight.addEventListener("input", function(e) {
  if (!/^\d{0,5}(\.\d{0,2})?$/.test(e.target.value)) {
    e.target.value = e.target.value.slice(0, -1);
  }

   if (this.value.match(/^(3[0-9]|[4-9][0-9]|[1-9][0-9][0-9]|200)(\.[0-9]{1,2})?$/)) {
    document.getElementById("result").innerHTML = "";
  }
  if (!this.value.match(/^(3[0-9]|[4-9][0-9]|[1-9][0-9][0-9]|200)(\.[0-9]{1,2})?$/)) {
    this.setCustomValidity("weight should be between 30 kg and 200 kg");
  } else {
    this.setCustomValidity("");
  }
});

const inputHeight = document.getElementById("height");
inputHeight.addEventListener("input", function(e) {
  if (!/^\d{0,5}(\.\d{0,2})?$/.test(e.target.value)) {
e.target.value = e.target.value.slice(0, -1);
  }

  if (this.value.match(/^(6[0-9]|[7-9][0-9]|[1-9][0-9][0-9]|2[0-4][0-9][0-9]|250)(.[0-9]{1,2})?$/)) {
    document.getElementById("result").innerHTML = "";
  }
  if (!this.value.match(/^(6[0-9]|[7-9][0-9]|[1-9][0-9][0-9]|2[0-4][0-9][0-9]|250)(.[0-9]{1,2})?$/)) {
    this.setCustomValidity("height should be between 60 cm and 250 cm");
  } else {
    this.setCustomValidity("");
  }
});


const inputAge = document.getElementById("age");
inputAge.addEventListener("input", function(e) {
  if (!/^\d{0,3}(\.\d{0,1})?$/.test(e.target.value)) {
    e.target.value = e.target.value.slice(0, -1);
  }
  
  var age = document.getElementById("age").value;
  if (/^\d{0,3}(\.\d{0,1})?$/.test(age) && age >= 1 && age <= 120) {
    document.getElementById("result").innerHTML = "";
  }
  if (!/^\d{0,3}(\.\d{0,1})?$/.test(age) || age < 1 || age > 120) {
    this.setCustomValidity("Invalid age. Age must be a whole number between 1 and 120");
  } else {
    this.setCustomValidity("");
  }
  
  if (age % 1 !== 0) {
    if (age % 1 >= 0.1 && age % 1 < 0.6) {
      age = Math.floor(age);
    } else {
      age = Math.ceil(age);
    }
    document.getElementById("age").value = age;
  }
});

 function preventSpecialChar(event) {
  if (event.which != 8 && event.which != 0 && (event.which < 48 || event.which > 57) && event.which !== 46) {
    event.preventDefault();
  }
}
document.getElementById("weight").addEventListener("keypress", preventSpecialChar);
document.getElementById("height").addEventListener("keypress", preventSpecialChar);
document.getElementById("age").addEventListener("keypress", preventSpecialChar);

document.getElementById("bmi-form").addEventListener("submit", function(event) {
  event.preventDefault();
  document.querySelector(".box").style.minHeight = "600px";
});
document.addEventListener("keyup", function(event) {
  if (event.key === "Enter") {
    calculateBMI();
  }
});

 function calculateBMI() {
   // Get the inputs
   var weight = document.getElementById("weight").value;
   var height = document.getElementById("height").value;
   var age = document.getElementById("age").value;

   if (weight < 30 || weight > 200) {
    document.getElementById("result").innerHTML = "Error: Invalid weight entered";
    return;
   }
   if (height < 60 || height > 250) {
    document.getElementById("result").innerHTML = "Error: Invalid height entered";
    return;
   }
   if (age < 1 || age > 120) {
    document.getElementById("result").innerHTML = "Error: Invalid age entered";
    return;
  }
   if (!weight || !height || !age) {
    document.getElementById("result").innerHTML = "Error: Please enter weight, height, and age.";
    return;
   }
    var gender = document.getElementById("gender").value;
    var activityLevel = document.getElementById("activity-level").value;

    // Calculate the BMI
    var bmi = weight / ((height / 100) * (height / 100));

    // Determine the user's BMR based on gender and age
    var bmr;
    if (gender === "male") {
      bmr = 66.47 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
    } else if (gender === "female") {
      bmr = 655.1 + (9.563 * weight) + (1.850 * height) - (4.676 * age);
    } else {
      // Error: gender not selected
      document.getElementById("result").innerHTML = "Error: Gender not selected";
       return;
    }

    // Determine the user's daily calorie needs based on activity level
      var calorieNeeds;
      switch (activityLevel) {
        case "sedentary":
          calorieNeeds = bmr * 1.2;
          break;
        case "lightly-active":
          calorieNeeds = bmr * 1.375;
          break;
        case "moderately-active":
          calorieNeeds = bmr * 1.55;
          break;
        case "very-active":
            calorieNeeds = bmr * 1.725;
          break;
        case "extra-active":
          calorieNeeds = bmr * 1.9;
          break;
        default:
          // Error: activity level not selected
          document.getElementById("result").innerHTML = "Error: Activity level not selected";
          return;
      }

        // Determine the user's BMI category based on their BMI
        var bmiCategory;
        if (bmi < 18.5) {
          bmiCategory = "Underweight";
        } else if (bmi >= 18.5 && bmi < 25) {
          bmiCategory = "Normal weight";
        } else if (bmi >= 25 && bmi < 30) {
          bmiCategory = "Overweight";
        } else {
          bmiCategory = "Obese";
        }

        // Output the BMI and description
        document.getElementById("result").innerHTML = "Your BMI is " + bmi.toFixed(2) + " and you are " + bmiCategory + ".";
        document.getElementById("calorie-result").innerHTML = "You need " + calorieNeeds.toFixed(1) + " calories per day.";
      };
const progressBar = document.querySelector("#progress");
let taskCounter = 0;
let weightCounter = 0;
let heightCounter = 0;
let ageCounter = 0;
let genderCounter = 0;
let activityCounter = 0;

function updateProgress(percent) {
progressBar.style.width = percent + "%";
}

function completeTask() {
taskCounter = weightCounter + heightCounter + ageCounter + genderCounter + activityCounter;
updateProgress((taskCounter / 5) * 100);
}

document.querySelector("#weight").addEventListener("input", function() {
if (this.value === "" || this.value < 30 || this.value > 200) {
weightCounter = 0;
} else {
weightCounter = 1;
}
completeTask();
});

document.querySelector("#height").addEventListener("input", function() {
if (this.value === "" || this.value < 60 || this.value > 250) {
heightCounter = 0;
} else {
heightCounter = 1;
}
completeTask();
});

document.querySelector("#age").addEventListener("input", function() {
if (this.value === "" || this.value < 1 || this.value > 120) {
ageCounter = 0;
} else {
ageCounter = 1;
}
completeTask();
});

document.querySelector("#gender").addEventListener("input", function() {
if (this.value === "") {
genderCounter = 0;
} else {
genderCounter = 1;
}
completeTask();
});

document.querySelector("#activity-level").addEventListener("input", function() {
if (this.value === "") {
activityCounter = 0;
} else {
activityCounter = 1;
}
completeTask();
});

document.querySelector("[type=reset]").addEventListener("click", function() {
taskCounter = 0;
weightCounter = 0;
heightCounter = 0;
ageCounter = 0;
genderCounter = 0;
activityCounter = 0;
document.getElementById("result").innerHTML = "";
document.getElementById("calorie-result").innerHTML = "";
document.querySelector(".box").style.minHeight = "600px";
updateProgress(0);
});

window.onload = function() {
document.getElementById("bmi-form").reset();
progressBar.style.width = "0%";
taskCounter = 0;
weightCounter = 0;
heightCounter = 0;
ageCounter = 0;
genderCounter = 0;
activityCounter = 0;
completeTask();
};
</script>
</body>
</html>
