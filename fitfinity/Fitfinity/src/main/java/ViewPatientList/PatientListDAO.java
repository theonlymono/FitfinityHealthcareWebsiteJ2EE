package ViewPatientList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PatientListDAO {

	public List<PatientInfo> getPatientList(String userid)
	{
		List<PatientInfo> list = new ArrayList<PatientInfo>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitfinity","root", "");
			
			String query = "SELECT a.patientID, p.patientName, p.gender, FLOOR(DATEDIFF(CURDATE(), p.patientDOB) / 365) AS age FROM appointments a LEFT JOIN patients p ON a.patientid = p.patientid WHERE a.doctorID = ? AND a.appointmentData = CURDATE()";
			PreparedStatement p = c.prepareStatement(query);
			
			p.setString(1, userid);
			ResultSet r = p.executeQuery();
			
			while(r.next()) {
				list.add(new PatientInfo(r.getString("patientID"), r.getString("patientName"), r.getString("gender"), r.getInt("age")));
			}
		}
		catch (Exception e) {
			e.getStackTrace();
		}
		
		
		return list;
	}
}
