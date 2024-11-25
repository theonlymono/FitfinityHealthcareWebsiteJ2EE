<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Form Validation</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="icon" href="./image/logo.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet" />
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	background: rgb(53,117,254);
	background: linear-gradient(180deg, #0bb288 0%, #0bb288 0%, white 100%);    
	background-size: cover;
    background-position: center;
    background-attachment: fixed;
    background-repeat: no-repeat;
}

.container {
	width: 90vw;
	max-width: 600px;
	padding: 2em 1.5em;
	background-color: #ffffff;
	margin: 70px auto;
	border-radius: 30px;
}

h4 {
	font-size: 1.5em;
}

.button-container {
    /* display: flex; */
    justify-content: center;
    margin-top: 0.2em;
    padding: 0 5em;
  }

  
  .button-container button {
    
    padding: 0.7em 1.5em;
    border: none;
    color: #ffffff;
    cursor: pointer;
    box-shadow: 5px 25px 27px rgba(0, 0, 0, 0.1);
    text-align: center;
  }

  a{
  	text-align: center;
  	justify-content: center;
  }
  
  .button-container #back-button {
    background-color: #0bb288;
    border-radius: 30px;
    margin-right: 5.5em;
  }

  
  .button-container #signup-button {
    background-color: #0bb288;
    border-radius: 30px;
    margin-left: 5.5em;
    
  }

.input-section {
	margin: 0.5em 1.5em;
}

label, .error-message {
	display: block;
	font-size: 1em;
}

label {
	margin-bottom: 0.5em;
	font-weight: 500;
}

.error-message {
	margin-top: 0.2em;
}

input, button, select {
	display: block;
	outline: none;
	width: 100%;
	padding: 0.5em;
	border-radius: 30px;
}

select {
	padding: 1em 0.5em;
	border: 1.5px solid #dOdOdO;
}

input {
	padding: 1em 1.5em;
	border: 1.5px solid #d0d0d0;
}

input[type="radio"] {
	width: fit-content;
	margin-right: 0.5em;
}

button {
	font-size: 1em;
	background-color: #0bb288;
	border: none;
	color: #ffffff;
	padding: 0.8em 0;
	margin-top: 2em;
}

.required-color {
	color: #ff4747;
}

.error {
	border-color: #ff4747;
}

.valid {
	border-color: #37a137;
}

.hide {
	display: none;
}

@media only screen and (max-width: 450px) {
	.container {
		font-size: 14px;
	}
}

.error-message {
            color: red;
        }
        
.radio-group {
    display: flex;
    margin-top: 0.5em;
    align-items: center;
  }

  .radio-label {
    margin-right: 1em;
    display: flex;
    align-items: center;
  }
  
  .radio-label input {
    margin-right: 0.5em;
  }
  
.nrc-section {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.nrc-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 10px;
}

.nrc-dropdown,
#patientNRC {
    width: 100%;
    padding: 0.5em;
    border-radius: 30px;
}

</style>
</head>
<body>
	<div class="container">
    <form action="${pageContext.request.contextPath}/SignUPServlet" method="post">
        <h4>Create User Account</h4>
		
<!-- Name -->
		<div class="input-section">
          <label>
            	<i class="fa-solid fa-id-card-clip" style="color: #0bb288;"></i> Name <span class="required-color">*</span>
          </label>
          <input type="text" placeholder="Enter your name" name="patientName" id="patientName" value="${param.patientName}" required/>
        
        <% String error1 = (String) request.getAttribute("message1"); 
			if(error1!=null)
			{
		%>
		
			<span class="error-message"> <%= error1 %>  </span> <br>
			<% } else { %>
		        <br>
		    <% } %>
		</div>
        
<!-- Email --> 
		<div class="input-section"> 
          <label>
            	<i class="fa-regular fa-envelope" style="color: #0bb288;"></i> Email <span class="required-color">*</span>
          </label>
          <input type="text" placeholder="Enter your email" name="patientEmail" id="patientEmail" value="${param.patientEmail}" required/>
          <% String error2 = (String) request.getAttribute("message2"); 
			if(error2!=null)
			{
			%>
			
			<span class="error-message"> <%= error2 %>  </span> <br>
			<% } else { %>
		        <br>
		    <% } %>
        </div>
		
<!-- NRC -->
        <div class="input-section">
    <label>
        <i class="fa-regular fa-address-card" style="color: #0bb288;"></i> NRC Card Number <span class="required-color">*</span>
    </label>
    <div class="nrc-grid">
    
	  <select id="firstSelect" name="state" onchange="updateSecondSelect()" class="nrc-dropdown">
	    <option value="1">1</option>
	    <option value="2">2</option>
	    <option value="3">3</option>
	    <option value="4">4</option>
	    <option value="5">5</option>
	    <option value="6">6</option>
	    <option value="7">7</option>
	    <option value="8">8</option>
	    <option value="9">9</option>
	    <option value="10">10</option>
	    <option value="11">11</option>
	    <option value="12">12</option>
	    <option value="13">13</option>
	    <option value="14">14</option>
	  </select>
	
	  
	  <select id="secondSelect" name="city" class="nrc-dropdown">
	    
	    <!-- Options will be dynamically added here -->
	  </select>
	  
	  <select id="thirdSelect" name="citizen" class="nrc-dropdown">
	    <option value="(C)">(C)</option>
	    <option value="(A)">(A)</option>
	    <option value="(N)">(N)</option>
	  </select>
	  
	  <input type="text" placeholder="NRC number" name="number" id="patientNRC" value="${param.patientNRC}" required/>
	  </div>
	  
	  <script src="./NRC.js"></script>
	  <br>
	  <% String error3 = (String) request.getAttribute("message3"); 
			if(error3!=null)
			{
			%>
			
			<span class="error-message"> <%= error3 %>  </span> <br>
			<% } else { %>
		        <br>
		    <% } %>
</div>

        
<!-- Date Of Birth -->
        <div class="input-section">
            <label>
            	<i class="fa-solid fa-calendar-days" style="color: #0bb288;"></i> Date Of Birth <span class="required-color">*</span>
            </label>
            <div style="position: relative;">
            <input type="date" min="1943-1-1" max="2008-12-31" name="patientDOB" id="patientDOB" style="padding: 0.5em; border-radius: 30px; width: 100%; border: 1.5px solid #d0d0d0;"  value="${param.patientDOB}">
        	</div>
        </div>
        <br>
		    
<!-- Phone -->
        <div class="input-section">
            <label>
            	<i class="fa-solid fa-phone" style="color: #0bb288;"></i> Phone Number <span class="required-color">*</span>
            </label>
            <input type="text" name="patientTel" id="pstientTel" value="${param.patientTel}"  placeholder="Enter doctor's phone: 09">
            
            <% String error5 = (String) request.getAttribute("message4"); 
				if(error5!=null)
				{
			%>
			
			<span class="error-message"> <%= error5 %>  </span> <br>
			<% } else { %>
		        <br>
		    <% } %>
        </div>
        
<!-- Password -->
		<div class="input-section"> 
          <label>
            	<i class="fa-solid fa-lock" style="color: #0bb288;"></i> Password <span class="required-color">*</span>
          </label>
          <input type="password"  placeholder="Enter a Password" id="patientPwd" name="patientPwd" value="${param.patientPwd}" required/>
          <h5> Password must include at least one capital letter, one small letter, one number, and one special character" name="patientPwd </h5>
          
         <% String error6 = (String) request.getAttribute("message5"); 
			if(error6!=null)
			{
		 %>
		
		<span class="error-message"> <%= error6 %>  </span> <br>
			<% } else { %>
		        <br>
		    <% } %>
         </div>
		
<!-- Confirm Password -->
		<div class="input-section"> 
          <label>
            	<i class="fa-solid fa-key" style="color: #0bb288;"></i> Confirm Password <span class="required-color">*</span>
          </label>
          <input type="password" placeholder="Confirm Your Password" name="confPwd" id="confPwd" value="${param.confPwd}" required/>
          
          <% String error7 = (String) request.getAttribute("message6"); 
			if(error7!=null)
			{
		  %>
			
		  <span class="error-message"> <%= error7 %>  </span> <br>
		  <% } else { %>
	         <br>
	  	  <% } %>
       </div>

        
<!-- BloodType -->
        <div class="input-section"> 
          <label>
            	<i class="fa-solid fa-droplet" style="color: #0bb288;"></i> Blood Type <span class="required-color">*</span>
          </label>
          <label for="bloodType">Select Blood Type:</label>
		    <select id="bloodType" name="bloodType">
		        <option value="A" ${param.bloodType == 'A' ? 'selected' : ''}>A</option>
			    <option value="B" ${param.bloodType == 'B' ? 'selected' : ''}>B</option>
			    <option value="AB" ${param.bloodType == 'AB' ? 'selected' : ''}>AB</option>
			    <option value="O" ${param.bloodType == 'O' ? 'selected' : ''}>O</option>
		    </select>
          
        </div>
        
<!-- Gender -->

			<div class="input-section">
				<label> <i class="fa-solid fa-venus-mars"
					style="color: #0bb288;"></i> Gender <span class="required-color" >*</span>
				</label>
				<div class="radio-group">
					<label class="radio-label"> 
						<input type="radio" name="gender" value="Male" ${param.gender == 'Male' ? 'checked' : ''} required > Male
					</label> 
					<label class="radio-label"> 
						<input type="radio" name="gender" value="Female"  ${param.gender == 'Male' ? 'checked' : ''} required> Female
					</label>
					<label class="radio-label"> 
						<input type="radio" name="gender" value="Other"  ${param.gender == 'Male' ? 'checked' : ''} required> Other
					</label>
				</div>
				<% String error9 = (String) request.getAttribute("message7");
				   if (error9 != null) {
				%>
				<span class="error-message"> <%=error9%> </span> <br>
				<% } else { %> <br>
				<% } %>
			</div>

      <div class="button-container">
        <button id="back-button">
        	<a style="padding-left: 45%; padding-right: 45%; padding-top: 2%; padding-bottom: 2%; text-decoration: none; color: #ffffff;" href=""> Back </a>
        </button>
        <button id="submit-button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"> Signup </button>
       </div>
    </form>
    
    
    
    <c:if test="${not empty message}">
		    <h3 style='color:green'>${message}</h3>
		    <c:remove var="message"/>
	</c:if>
</div>
</body>
</html>