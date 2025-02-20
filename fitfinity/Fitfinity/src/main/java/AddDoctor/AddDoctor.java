package AddDoctor;

import java.io.IOException;

import java.security.PublicKey;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.FormatFlagsConversionMismatchException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String msg = null;
	private String msg2 = null;

	public AddDoctor() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String doctorID = request.getParameter("doctorID");
		String doctorName = request.getParameter("doctorName");
		String doctorEmail = request.getParameter("doctorEmail");
		String doctorTel = request.getParameter("doctorTel");
		String doctorPassword = request.getParameter("doctorPwd");
		String deptID = request.getParameter("deptID");
		String roleID = request.getParameter("roleID");

		

		if (!checkID(doctorID) || !checkName(doctorName) || !checkEmail(doctorEmail) || !checkTel(doctorTel)
				|| !checkPwd(doctorPassword) || !checkDept(deptID)
				|| !checkRole(roleID)) {
			if (checkID(doctorID) == false) {
				request.setAttribute("message1", msg);
			}
			if (checkName(doctorName) == false) {
				request.setAttribute("message2", "Invalid Name Input");
			}
			if (checkEmail(doctorEmail) == false) {
				request.setAttribute("message3", msg2);
			}
			if (checkTel(doctorTel) == false) {
				request.setAttribute("message4", "Invalid Phone Input");
			}
			if (checkPwd(doctorPassword) == false) {
				request.setAttribute("message5", "Invalid Password Input");
			}
			if (checkDept(deptID) == false) {
				request.setAttribute("message6", "Invalid Department Input");
			}
			if (checkRole(roleID) == false) {
				request.setAttribute("message8", "Invalid Role ID Input");
			}
			request.setAttribute("doctorID", doctorID);
			request.setAttribute("doctorName", doctorName);
			request.setAttribute("doctorEmail", doctorEmail);
			request.setAttribute("doctorTel", doctorTel);
			request.setAttribute("doctorPassword", doctorPassword);
			request.setAttribute("deptID", deptID);
			request.setAttribute("roleID", roleID);
		}

		if (checkID(doctorID) && checkName(doctorName) && checkEmail(doctorEmail) && checkTel(doctorTel)
				&& checkPwd(doctorPassword) && checkDept(deptID) && checkRole(roleID)) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");

				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity", "root", "");
				Statement s = c.createStatement();
				ResultSet resultSet = s.executeQuery("SELECT * FROM doctors");

				String sql = "INSERT INTO doctors(doctorID, doctorName, doctorEmail, doctorTel, doctorPassword, deptID, roleID) VALUES ('"
						+ doctorID + "','" + doctorName + "','" + doctorEmail + "','" + doctorTel + "','"
						+ doctorPassword + "','" + deptID + "','" + roleID + "')";

				int res = s.executeUpdate(sql);

				if (res == 1) {
					request.setAttribute("message","successful");
					request.getRequestDispatcher("./adminDashboard.jsp").forward(request, response);
				}

				resultSet.close();
				c.close();
				s.close();

			} catch (Exception e) {
			}
		} else {
			request.getRequestDispatcher("./drSignUp.jsp").forward(request, response);
		}

	}

	// Validation

//ID validation
	private boolean checkID(String doctorID) {

		boolean flag = true;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity", "root", "");
			Statement s = c.createStatement();
			ResultSet resultSet = s.executeQuery("SELECT * FROM doctors");

			while (resultSet.next()) {
				String dbID = resultSet.getString("doctorID");
				if (doctorID.equals(dbID)) {
					msg = "There is already an existing ID";
					flag = false;
				}

				if (!doctorID.matches("^Dr-[0-9]{3}$")) {
					msg = "Invalid ID input";
					flag = false;
				}
				
			}
			resultSet.close();
			c.close();
			s.close();
		}
	 
	 catch (Exception e) 
	{ 
		 
	} 
		return flag; }

//Name Validation
	private boolean checkName(String doctorName) {
		return doctorName.matches("^[a-zA-Z][a-zA-Z ]{4,24}$");
	}

//Telephone Validation
	private boolean checkTel(String doctorTel) {
		return doctorTel.matches("^[0-9]{8,11}$");
	}

//Email Validation
	 private boolean checkEmail(String doctorEmail) 
	 { 
		 boolean flag = true; 
		 try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
		 
			 Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity", "root", ""); 
			 Statement s = c.createStatement(); 
			 ResultSet resultSet = s.executeQuery("SELECT * FROM doctors");
		 
		 
			 while (resultSet.next()) 
			 { 
				 String dbEmail = resultSet.getString("doctorEmail"); 
				 if(doctorEmail.equals(dbEmail)) 
				 {
					 msg2 = "There is already an existing Email"; 
					 flag = false; 
				} 
				if(!doctorEmail.matches("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$")) 
				{
					msg2 = "Invalid Email input";
					flag = false; 
				}
			  
			 } 
			 resultSet.close(); c.close(); s.close(); }
		 
		 catch (Exception e) { } 
		 return flag; }

//Password Validation
	private boolean checkPwd(String doctorPassword) {
		return doctorPassword.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,20}$");
	}

//Department Validation
	private boolean checkDept(String deptID) {
		return deptID.matches("^D-[1-7]{1}$");
	}


//Role Validation
	private boolean checkRole(String roleID) {
		return roleID.matches("^R-[1-3]{1}$");
	}

}
