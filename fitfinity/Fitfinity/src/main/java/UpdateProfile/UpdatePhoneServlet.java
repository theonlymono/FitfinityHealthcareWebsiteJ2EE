package UpdateProfile;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdatePhoneServlet")
public class UpdatePhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdatePhoneServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String updatedPhone = request.getParameter("updatedPhone");
		
		boolean flag = checkTel(updatedPhone);
		
		if(flag)
		{
			updatePhone(updatedPhone, userid);
			
			request.setAttribute("userid", userid);
			request.setAttribute("message3", "Phone Number Updated Successfully");
			request.getRequestDispatcher("./ProfileUpdate.jsp?userid="+userid).forward(request, response);
		}
		else {
			request.setAttribute("username", updatedPhone);
			request.setAttribute("userid", userid);
			request.setAttribute("message4","Invalid Phone Number");
			request.getRequestDispatcher("./ProfileUpdate.jsp?userid=" + userid).forward(request, response);
		}
	}

	private boolean checkTel(String doctorTel) {
		return doctorTel.matches("^[0-9]{8,11}$");
	}
	
	public void updatePhone(String patientPhone, String userid) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			String sql = "UPDATE patients SET patientPhone = ? WHERE patientID = ?";
			PreparedStatement p = c.prepareStatement(sql);
			p.setString(1, patientPhone);
			p.setString(2, userid);
			int res = p.executeUpdate();
			
			c.close();
			p.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		
	}

}
