package UpdateProfile;

import java.util.*;
import java.sql.*;

public class ProfileDAO {

	
	public String getName(String userid) {
		String name=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			String sql = "SELECT patientName FROM patients WHERE patientID =?";
            PreparedStatement stmt = c.prepareStatement(sql);
            stmt.setString(1, userid);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next())
            	
            {
            	name = rs.getString("patientName");
            }
            
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return name;
	}
	public String getNRC(String userid) {
		String nrc=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			String sql = "SELECT patientNRC FROM patients WHERE patientID =?";
			PreparedStatement stmt = c.prepareStatement(sql);
			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next())
				
			{
				nrc = rs.getString("patientNRC");
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return nrc;
	}
	public String getDOB(String userid) {
		String dob=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			String sql = "SELECT patientDOB FROM patients WHERE patientID =?";
			PreparedStatement stmt = c.prepareStatement(sql);
			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next())
				
			{
				dob = rs.getString("patientDOB");
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return dob;
	}
	public String getPhone(String userid) {
		String phone=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			String sql = "SELECT patientPhone FROM patients WHERE patientID =?";
			PreparedStatement stmt = c.prepareStatement(sql);
			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next())
				
			{
				phone = rs.getString("patientPhone");
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return phone;
	}
	public String getBlood(String userid) {
		String blood=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			String sql = "SELECT bloodType FROM patients WHERE patientID =?";
			PreparedStatement stmt = c.prepareStatement(sql);
			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next())
				
			{
				blood = rs.getString("bloodType");
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return blood;
	}
	public String getGender(String userid) {
		String g=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			String sql = "SELECT gender FROM patients WHERE patientID =?";
			PreparedStatement stmt = c.prepareStatement(sql);
			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next())
				
			{
				g = rs.getString("gender");
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return g;
	}
	public String getEmail(String userid) {
		String em=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			String sql = "SELECT patientEmail FROM patients WHERE patientID =?";
			PreparedStatement stmt = c.prepareStatement(sql);
			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next())
				
			{
				em = rs.getString("patientEmail");
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return em;
	}
}
