package ViewSalary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SalaryDAO {

	//To give doctorID as parameter
		public List<String> getDrID(){
			List<String> drIDList = new ArrayList<String>();
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection c = DriverManager.getConnection("jsbc:mysql://localhost:3306/fitfinity","root","");
				
				Statement s = c.createStatement();
				ResultSet r = s.executeQuery("SELECT * FROM doctors");
				
				while(r.next())
				{
					drIDList.add(r.getString("doctorID"));
				}
				
			} catch (Exception e) {
				
			}
			
			return drIDList;
		}
		
	//To give appointmentData as parameter
		public List<String> getApmtDate()
		{
			List<String> apmtDate = new ArrayList<String>();
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root","");
				Statement s = c.createStatement();
				ResultSet r = s.executeQuery("SELECT * FROM appointments");
				
				while(r.next())
				{
					apmtDate.add(r.getString("appointmentData"));
				}
			}
			catch (Exception e) {
			}
			
			return apmtDate;
		}
		
	//To get total patient count
		public Integer countPatient(String doctorID, String appointmentData){
			
			int patientNo = 0;
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
				String sql = "SELECT COUNT(*) AS patientNo FROM appointments WHERE doctorID = ? AND appointmentData = ?";
				
				PreparedStatement p = c.prepareStatement(sql);
				p.setString(1, doctorID);
				p.setString(2, appointmentData);
				
				ResultSet r = p.executeQuery();
				while(r.next()) {
					patientNo = r.getInt("patientNo");
				}
			}
			catch (Exception e) {
				
			}
			
			return patientNo;
		}
		
//getting Salary List
		
		public List<Salary> getPcount(){
			
			List<Salary> pCount = new ArrayList<Salary>();
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
				String sql = "SELECT d.doctorID, d.doctorName, r.roleName, a.appointmentData, r.fixedSalary, COUNT(*) AS Patient_Number, COUNT(*) * r.fixedSalary AS Total_Salary FROM doctors d LEFT JOIN appointments a ON a.doctorID = d.doctorID LEFT JOIN roles r ON r.roleID = d.roleID WHERE a.appointmentData IS NOT NULL GROUP BY d.doctorID, a.appointmentData ORDER BY a.appointmentData, d.doctorID";
				
				PreparedStatement p = c.prepareStatement(sql);
				ResultSet r = p.executeQuery();
				
				while(r.next())
				{
					pCount.add(new Salary(r.getString("doctorID"), r.getString("doctorName"), r.getString("roleName"), r.getString("appointmentData"), r.getString("fixedSalary"), r.getInt("Patient_Number"), r.getString("Total_Salary")));
				}
				
				
				r.close();
				p.close();
				c.close();
			}
			
			
			catch (Exception e) {
				
			}
			
			return pCount;
		}
	

//checking if there is any salary for today.
		
		public List<Salary> checkSalary(String doctorID) {
			
			List<Salary> sList = new ArrayList<Salary>();
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root","");

				String query = "SELECT a.appointmentData, COUNT(*) AS totalPatient, COUNT(*) * r.fixedSalary AS TodaySalary FROM doctors d LEFT JOIN appointments a ON a.doctorID = d.doctorID LEFT JOIN roles r ON r.roleID = d.roleID WHERE d.doctorID = ? AND a.appointmentData = CURDATE() GROUP BY d.doctorID, a.appointmentData ORDER BY a.appointmentData, d.doctorID";
				PreparedStatement p = c.prepareStatement(query);
				p.setString(1, doctorID);
				
				ResultSet r = p.executeQuery();
				
				while(r.next())
				{
					sList.add(new Salary(r.getString("appointmentData"), r.getInt("totalPatient"), r.getString("TodaySalary")));
				}
			}
			catch (Exception e) {
				
			}
			
			return sList;
		}
		
		public List<Salary> checkMonthSalary(String doctorID){
			
			List<Salary> smList = new ArrayList<Salary>();
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root","");
                
                String query = "SELECT CONCAT(YEAR(a.appointmentData), ' ', DATE_FORMAT(a.appointmentData, '%b')) AS month,COUNT(*) AS totalPatient, COUNT(*)* r.fixedSalary AS Salary FROM doctors d LEFT JOIN appointments a ON a.doctorID = d.doctorID LEFT JOIN roles r ON r.roleID = d.roleID WHERE d.doctorID = ? GROUP BY month, d.doctorID ORDER BY a.appointmentData, d.doctorID";
                PreparedStatement p = c.prepareStatement(query);
                p.setString(1, doctorID);
                
                ResultSet r = p.executeQuery();
                
                while(r.next()) {
                	smList.add(new Salary(r.getInt("totalPatient"), r.getString("month"), r.getString("Salary")));
                }
                
			} catch (Exception e) {
				e.getStackTrace();
			}
            
            return smList;
		}
}
		