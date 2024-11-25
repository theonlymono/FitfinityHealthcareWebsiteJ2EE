package ViewPatientList;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/PListServlet")
public class PListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public PListServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		
        
        
        request.setAttribute("userid", userid);
        request.getRequestDispatcher("./doctorDashboard.jsp").forward(request, response);
        
	}

	
}
