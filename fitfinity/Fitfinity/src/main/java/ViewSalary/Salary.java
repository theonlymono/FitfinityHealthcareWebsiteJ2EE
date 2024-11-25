package ViewSalary;

public class Salary {
	public Salary(String doctorID, String doctorName,String roleName, String appointmentDate, String fixedSalary, int patientCount, String totalSalary) {
		super();
		this.doctorID = doctorID;
		this.doctorName = doctorName;
		this.roleName = roleName;
		this.appointmentDate = appointmentDate;
		this.patientCount = patientCount;
		this.totalSalary = totalSalary;
		this.fixedSalary = fixedSalary;
	}
	
	public Salary(String appointmentDate, int patientCount, String totalSalary)
	{
		this.appointmentDate = appointmentDate;
		this.patientCount = patientCount;
		this.totalSalary = totalSalary;
	}
	
	public Salary(int patientCount, String month, String totalSalary) {
		this.month = month;
		this.patientCount = patientCount;
		this.totalSalary = totalSalary;
	}
	
	
	private String doctorID, doctorName, appointmentDate, roleName, totalSalary, fixedSalary, month;
	private int patientCount;
	
	public String getFixedSalary() {
		return fixedSalary;
	}
	public void setFixedSalary(String fixedSalary) {
		this.fixedSalary = fixedSalary;
	}
	
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getTotalSalary() {
		return totalSalary;
	}
	public void setTotalSalary(String totalSalary) {
		this.totalSalary = totalSalary;
	}

	public String getDoctorID() {
		return doctorID;
	}
	public void setDoctorID(String doctorID) {
		this.doctorID = doctorID;
	}
	public String getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public int getPatientCount() {
		return patientCount;
	}
	public void setPatientCount(int patientCount) {
		this.patientCount = patientCount;
	}
	
	
}
