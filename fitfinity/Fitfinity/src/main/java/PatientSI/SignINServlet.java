package PatientSI;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignINServlet")
public class SignINServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SignINServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // For now, do nothing in the doGet method.
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String loginEmail = request.getParameter("loginEmail");
        String loginPwd = request.getParameter("loginPwd");
        String role = request.getParameter("userRole");

        Boolean validEmail = emailAuth(loginEmail, role);
        Boolean validPwd = pwdAuth(loginPwd, loginEmail, role);
        String userName = getUserName(loginEmail, role);
        String userId = getUserId(loginEmail, role);

        if (validEmail) {
            if (validPwd) {
                request.setAttribute("userName", userName);
                request.setAttribute("userId", userId);
                if (role.equals("Patient")) {
                    request.getRequestDispatcher("./patientDashboard.jsp").forward(request, response);
                } else if (role.equals("Doctor")) {
                    request.getRequestDispatcher("./doctorDashboard.jsp").forward(request, response);
                } else if (role.equals("Admin")) {
                    request.getRequestDispatcher("./adminDashboard.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message2", "Wrong Password Entered");
                request.setAttribute("loginEmail", loginEmail);
                request.getRequestDispatcher("./LogInPage.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message3", "Sorry, we can't find an account with that email.");
            request.setAttribute("loginPwd", loginPwd);
            request.getRequestDispatcher("./LogInPage.jsp").forward(request, response);
        }
    }

    public Boolean emailAuth(String Email, String role) {
        Boolean flag = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity", "root", "");
            PreparedStatement ps = null;
            ResultSet r = null;

            if (role.equals("Patient")) {
                ps = c.prepareStatement("SELECT * FROM patients WHERE patientEmail = ?");
                ps.setString(1, Email);
                r = ps.executeQuery();
            } else if (role.equals("Doctor")) {
                ps = c.prepareStatement("SELECT * FROM doctors WHERE doctorEmail = ?");
                ps.setString(1, Email);
                r = ps.executeQuery();
            } else if (role.equals("Admin")) {
                ps = c.prepareStatement("SELECT * FROM admin WHERE adminEmail = ?");
                ps.setString(1, Email);
                r = ps.executeQuery();
            }

            if (r != null && r.next()) {
                flag = true;
            }

            // Close resources
            if (r != null) {
                r.close();
            }
            if (ps != null) {
                ps.close();
            }
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Boolean pwdAuth(String Pwd, String Email, String role) {
        Boolean flag2 = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity", "root", "");
            PreparedStatement ps = null;
            ResultSet r = null;

            if (role.equals("Patient")) {
                ps = c.prepareStatement("SELECT * FROM patients WHERE patientEmail = ? AND patientPassword = ?");
                ps.setString(1, Email);
                ps.setString(2, Pwd);
                r = ps.executeQuery();
            } else if (role.equals("Doctor")) {
                ps = c.prepareStatement("SELECT * FROM doctors WHERE doctorEmail = ? AND doctorPassword = ?");
                ps.setString(1, Email);
                ps.setString(2, Pwd);
                r = ps.executeQuery();
            } else if (role.equals("Admin")) {
                ps = c.prepareStatement("SELECT * FROM admin WHERE adminEmail = ? AND adminPwd = ?");
                ps.setString(1, Email);
                ps.setString(2, Pwd);
                r = ps.executeQuery();
            }

            if (r != null && r.next()) {
                flag2 = true;
            }

            // Close resources
            if (r != null) {
                r.close();
            }
            if (ps != null) {
                ps.close();
            }
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag2;
    }

    public String getUserName(String mail, String role) {
        String name = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity", "root", "");
            PreparedStatement p = null;
            ResultSet r = null;

            if (role.equals("Patient")) {
                p = c.prepareStatement("SELECT patientName FROM patients WHERE patientEmail = ?");
            } else if (role.equals("Doctor")) {
                p = c.prepareStatement("SELECT doctorName FROM doctors WHERE doctorEmail = ?");
            } else if (role.equals("Admin")) {
                p = c.prepareStatement("SELECT adminName FROM admin WHERE adminEmail = ?");
            }

            if (p != null) {
                p.setString(1, mail);
                r = p.executeQuery();
                if (r.next()) {
                    name = r.getString(1);
                }
            }

            // Close resources
            if (r != null) {
                r.close();
            }
            if (p != null) {
                p.close();
            }
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public String getUserId(String mail, String role) {
        String id = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity", "root", "");
            PreparedStatement p = null;
            ResultSet r = null;

            if (role.equals("Patient")) {
                p = c.prepareStatement("SELECT patientID FROM patients WHERE patientEmail = ?");
            } else if (role.equals("Doctor")) {
                p = c.prepareStatement("SELECT doctorID FROM doctors WHERE doctorEmail = ?");
            } else if (role.equals("Admin")) {
                p = c.prepareStatement("SELECT adminID FROM admin WHERE adminEmail = ?");
            }

            if (p != null) {
                p.setString(1, mail);
                r = p.executeQuery();
                if (r.next()) {
                    id = r.getString(1);
                }
            }

            // Close resources
            if (r != null) {
                r.close();
            }
            if (p != null) {
                p.close();
            }
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
}
