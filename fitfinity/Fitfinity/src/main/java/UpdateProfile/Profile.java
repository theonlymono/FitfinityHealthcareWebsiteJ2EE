package UpdateProfile;

public class Profile {
	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientEmail() {
		return patientEmail;
	}

	public void setPatientEmail(String patientEmail) {
		this.patientEmail = patientEmail;
	}

	public String getPatientNRC() {
		return patientNRC;
	}

	public void setPatientNRC(String patientNRC) {
		this.patientNRC = patientNRC;
	}

	public String getPatientDOB() {
		return patientDOB;
	}

	public void setPatientDOB(String patientDOB) {
		this.patientDOB = patientDOB;
	}

	public String getPatientPhone() {
		return patientPhone;
	}

	public void setPatientPhone(String patientPhone) {
		this.patientPhone = patientPhone;
	}

	public String getBloodType() {
		return bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Profile(String patientName, String patientEmail, String patientNRC, String patientDOB, String patientPhone,
			String bloodType, String gender) {
		super();
		this.patientName = patientName;
		this.patientEmail = patientEmail;
		this.patientNRC = patientNRC;
		this.patientDOB = patientDOB;
		this.patientPhone = patientPhone;
		this.bloodType = bloodType;
		this.gender = gender;
	}

	String patientName, patientEmail, patientNRC, patientDOB, patientPhone, bloodType, gender;
}
