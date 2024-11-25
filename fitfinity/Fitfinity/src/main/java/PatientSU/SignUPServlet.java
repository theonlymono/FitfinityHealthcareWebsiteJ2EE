package PatientSU;

import java.io.IOException;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SignUPServlet")
public class SignUPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String msg = null;
	private String msg2 = null;
       
    
    public SignUPServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String patientName = request.getParameter("patientName");
		String patientEmail = request.getParameter("patientEmail");
		
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String citizen = request.getParameter("citizen");
		String number = request.getParameter("number");
		
		String patientDOB = request.getParameter("patientDOB");
		String patientTel = request.getParameter("patientTel");
		String patientPwd = request.getParameter("patientPwd");
		String confPwd = request.getParameter("confPwd");
		String bloodType = request.getParameter("bloodType");
		String gender = request.getParameter("gender");
		
		String patientNRC = state + "/" + city + citizen + number;
		
		if(!checkName(patientName) || !checkEmail(patientEmail) || !checkNRC(patientNRC) || !checkTel(patientTel) || !checkPwd(patientPwd) || !checkConfPwd(confPwd, patientPwd) || !checkGender(gender)) {
			if(checkName(patientName)==false)
			{
				request.setAttribute("message1", "Invalid Name Input");	
			}
			if (checkEmail(patientEmail)==false) {
				request.setAttribute("message2", msg);
			}
			if(checkNRC(patientNRC)==false) {
				request.setAttribute("message3", "Invalid NRC");
			}
			if(checkTel(patientTel)==false) {
				request.setAttribute("message4", "Invalid Telephone Number");
			}
			if(checkPwd(patientPwd)==false) {
				request.setAttribute("message5", "Invalid Password");
			}
			if(checkConfPwd(confPwd, patientPwd)==false) {
				request.setAttribute("message6", "Confirm Password must be the same as Password");
			}
			if(checkGender(gender)) {
				request.setAttribute("message7", "Please Choose Your Gender");
			}
			request.setAttribute("patientName", patientName);
			request.setAttribute("patientEmail", patientEmail);
			request.setAttribute("patientNRC", patientNRC);
			request.setAttribute("patientEmail", patientEmail);
			request.setAttribute("patientNRC", patientNRC);
			request.setAttribute("patientTel", patientTel);
			request.setAttribute("patientPwd", patientPwd);
			request.setAttribute("confPwd", confPwd);
			request.setAttribute("gender", gender);
		}
		
		
		if (checkName(patientName) && checkEmail(patientEmail) && checkNRC(patientNRC) && checkTel(patientTel)
				&& checkPwd(patientPwd) && checkConfPwd(confPwd, patientPwd) && checkGender(gender)==false) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");

				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity", "root", "");
				Statement s = c.createStatement();
				ResultSet resultSet = s.executeQuery("SELECT * FROM patients");

				String sql = "INSERT INTO patients(patientName, patientEmail, patientNRC, patientDOB, patientPhone, patientPassword, bloodType, gender) VALUES ('"
						+ patientName + "','" + patientEmail + "','" + patientNRC + "','" + patientDOB + "','"
						+ patientTel + "','" + patientPwd + "','" + bloodType + "','" + gender + "')";

				int res = s.executeUpdate(sql);

				if (res == 1) {
					request.setAttribute("message","Registration successful");
					request.getRequestDispatcher("./LogInPage.jsp").forward(request, response);
				}

				resultSet.close();
				c.close();
				s.close();

			} catch (Exception e) {
			}
		} else {
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}
		
		
	}
	
//Name Validation
	private boolean checkName(String patientName) {
		return patientName.matches("^[a-zA-Z][a-zA-Z ]{4,24}$");
	}

	private boolean checkEmail(String patientEmail) 
	 { 
		 boolean flag = true; 
		 try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
		 
			 Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity", "root", ""); 
			 Statement s = c.createStatement(); 
			 ResultSet resultSet = s.executeQuery("SELECT * FROM patients");
		 
		 
			 while (resultSet.next()) 
			 { 
				 String dbEmail = resultSet.getString("patientEmail"); 
				 if(patientEmail.equals(dbEmail)) 
				 {
					 msg = "There is already an existing Email, Try another email or Log in!"; 
					 flag = false; 
				} 
				if(patientEmail.matches("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$")==false) 
				{
					msg = "Invalid Email input";
					flag = false; 
				}
			  
			 } 
			 resultSet.close(); c.close(); s.close(); }
		 
		 catch (Exception e) { } 
		 return flag; }
	
//NRC validation
	private boolean checkNRC(String patientNRC) {
		return patientNRC.matches("^([1-9]|1[0-4])\\/[A-Za-z]{1,10}\\((C|A|N)\\)\\d{6}$");
	}
	
//Telephone Validation
	private boolean checkTel(String doctorTel) {
		return doctorTel.matches("^[0-9]{8,11}$");
	}
	
//Password Validation
	private boolean checkPwd(String patientPwd) {
		return patientPwd.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,20}$");
	}

//Confirm Password Validation
	private boolean checkConfPwd(String confPwd, String patientPwd) {
		return confPwd.equals(patientPwd);
	}
	
//Gender Validation
	private boolean checkGender(String gender)
	{
		return gender.isEmpty();
	}
	
}
