package searchDr;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DoctorServlet")
public class DoctorServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String departmentId = request.getParameter("deptid");
        String patientID = request.getParameter("patientID");
        getDoctors(departmentId, patientID, response);
    }
    
    public void getDoctors(String departmentId,String patientID, HttpServletResponse response) {
    	
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = null;

        try {
            out = response.getWriter();
     
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity", "root", "")) {

                // Execute query to retrieve doctors based on departmentId
                String sql = "SELECT d.doctorID, d.doctorName, d.doctorEmail, d.doctorTel, dp.deptName, r.roleName " +
                             "FROM doctors d " +
                             "LEFT JOIN departments dp ON d.deptID = dp.deptID " +
                             "LEFT JOIN roles r using (roleID)" +
                             "WHERE d.deptID = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, departmentId);
                    try (ResultSet rs = pstmt.executeQuery()) {
                        // Build HTML response dynamically
                        StringBuilder htmlResponse = new StringBuilder();
                        while (rs.next()) {
                        	String checkMF = rs.getString("doctorName").substring(0,2);
                        	
                        	htmlResponse.append("<div class=\"col-md-6\">");
                        	htmlResponse.append("<div class=\"doctor-card\">");
                        	htmlResponse.append("<div class=\"doctor-card-content\">");
                        	htmlResponse.append("<span class=\"doctor-card-tag\">&#8226; Real-time Booking</span>");
                        	htmlResponse.append("<span class=\"doctor-card-tag\">&#8226; Fitfinity</span>");
                        	htmlResponse.append("<h3> Dr. " + rs.getString("doctorName") + "</h3>");
                        	htmlResponse.append("<p>Email: "+ rs.getString("doctorEmail") +"</p>");
                        	htmlResponse.append("<p>Tel: "+ rs.getString("doctorTel") +"</p>");
                        	htmlResponse.append("<p>Department: "+ rs.getString("deptName") +"</p>");
                        	htmlResponse.append("<p>Role: "+ rs.getString("roleName") +"</p>");
                        	
                        	htmlResponse.append("<a target=\"_blank\" style=\"background-color: #0bb288; color: white;\" href=\"./DrBooking.jsp?doctorID=" + rs.getString("doctorID") +  "&patientID=" + patientID + "\" class=\"btn\">Make Appointment</a>");
                        	htmlResponse.append("</div>");
							if (checkMF.equals("U ")) {
								htmlResponse.append("<img class=\"user-img\" src=\"./assets/image/doctorProfile/maleDr.png\" alt=\"Doctor Image\" />");								
							}else{
								htmlResponse.append("<img class=\"user-img\" src=\"./assets/image/doctorProfile/femaleDr.png\" alt=\"Doctor Image\" />");
							}
                        	
                        	htmlResponse.append("</div>");
                        	htmlResponse.append("</div>");
                        }
                        out.println(htmlResponse.toString());
                    }
                }
            }
        } catch (IOException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();  // You might want to handle the exception more appropriately
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }
}
