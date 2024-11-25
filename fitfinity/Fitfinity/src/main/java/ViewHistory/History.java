package ViewHistory;

public class History {
	
private String patientName, doctorName, date, allergies,surgical, past, current, family, medicine;
	
	public History(String patientName, String doctorName, String date, String allergies, String surgical, String past,
			String current, String family, String medicine) {
		super();
		this.patientName = patientName;
		this.doctorName = doctorName;
		this.date = date;
		this.allergies = allergies;
		this.surgical = surgical;
		this.past = past;
		this.current = current;
		this.family = family;
		this.medicine = medicine;
	}
	
	public History(String date, String doctorName, String allergies, String surgical, String past,
			String current, String family, String medicine) {
		super();
		
		this.doctorName = doctorName;
		this.date = date;
		this.allergies = allergies;
		this.surgical = surgical;
		this.past = past;
		this.current = current;
		this.family = family;
		this.medicine = medicine;
	}
	
	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAllergies() {
		return allergies;
	}

	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}

	public String getSurgical() {
		return surgical;
	}

	public void setSurgical(String surgical) {
		this.surgical = surgical;
	}

	public String getPast() {
		return past;
	}

	public void setPast(String past) {
		this.past = past;
	}

	public String getCurrent() {
		return current;
	}

	public void setCurrent(String current) {
		
		this.current = current;
		
	}

	public String getFamily() {
		return family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	public String getMedicine() {
		return medicine;
	}

	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}

}
