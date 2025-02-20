package ViewHistory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ViewDAO {

	
	public List<History> viewHistory(String pID){
		
		List<History> list = new ArrayList<History>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			String query = "SELECT p.patientName, d.doctorName, h.dateOfVisit, h.allergies, h.surgicalProcedures, h.pastMedHistory, h.currentMedHistory, h.familyHistory, h.medication FROM history h LEFT JOIN patients p ON p.patientID = h.patientID LEFT JOIN doctors d ON d.doctorID = h.doctorID WHERE h.patientID = ?";
			PreparedStatement p = c.prepareStatement(query);
			p.setString(1, pID);
			
			ResultSet r = p.executeQuery();
			
			while(r.next()) {
				list.add(new History(r.getString("patientName"), r.getString("doctorName"), r.getString("dateOfVisit"), r.getString("allergies"), r.getString("surgicalProcedures"), r.getString("pastMedHistory"), r.getString("currentMedHistory"), r.getString("familyHistory"), r.getString("medication")));
			}
		}
		catch(Exception e) {
            e.printStackTrace();
        }
		
		return list;
	}
	
	public List<History> viewMyHistory(String pid){
		List<History> myList = new ArrayList<History>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			String query = "SELECT h.dateOfVisit, d.doctorName, h.allergies, h.surgicalProcedures, h.pastMedHistory, h.currentMedHistory, h.familyHistory, h.medication FROM history h LEFT JOIN patients p ON p.patientID = h.patientID LEFT JOIN doctors d ON d.doctorID = h.doctorID WHERE h.patientID = ?";
			PreparedStatement p = c.prepareStatement(query);
			p.setString(1, pid);
			
			ResultSet r = p.executeQuery();
			
			while(r.next()) {
				myList.add(new History(r.getString("dateOfVisit"), r.getString("doctorName"), r.getString("allergies"), r.getString("surgicalProcedures"), r.getString("pastMedHistory"), r.getString("currentMedHistory"), r.getString("familyHistory"), r.getString("medication")));
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return myList;
	}
}
