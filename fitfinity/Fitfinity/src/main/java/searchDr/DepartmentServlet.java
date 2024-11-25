package searchDr;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity", "root", "")) {

                // Execute query to retrieve departments
                String sql = "SELECT deptID, deptName FROM departments";
                try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
                    // Build dropdown options dynamically
                	
                    while (rs.next()) {
                    	out.println("<a class=\"dropdown-item\" href=\"#\" data-deptid=\"" + rs.getString("deptID") + "\">" + rs.getString("deptName") + "</a>");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(out);
        }
    }
}


