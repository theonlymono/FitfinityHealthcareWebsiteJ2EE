package UpdateProfile;

import java.io.IOException;

import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.lookup.ImplicitNullAnnotationVerifier;


@WebServlet("/UpdateNameServlet")
public class UpdateNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateNameServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String updatedName = request.getParameter("updatedName");
		
		boolean flag = checkName(updatedName);
		
		if(flag)
		{
			updateName(updatedName, userid);
			request.setAttribute("username", updatedName);
			request.setAttribute("userid", userid);
			request.setAttribute("message1", "Name Updated Successfully");
			request.getRequestDispatcher("./ProfileUpdate.jsp?userid="+userid).forward(request, response);
		}
		else {
			request.setAttribute("username", updatedName);
			request.setAttribute("userid", userid);
			request.setAttribute("message2","Invalid Username");
			
			request.getRequestDispatcher("./ProfileUpdate.jsp?userid=" + userid).forward(request, response);
		}
	}

	private boolean checkName(String patientName) {
		return patientName.matches("^[a-zA-Z][a-zA-Z ]{4,24}$");
	}
	
	public void updateName(String patientName, String userid) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			String sql = "UPDATE patients SET patientName = ? WHERE patientID = ?";
			PreparedStatement p = c.prepareStatement(sql);
			p.setString(1, patientName);
			p.setString(2, userid);
			int res = p.executeUpdate();
			
			
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
	}
	
}
