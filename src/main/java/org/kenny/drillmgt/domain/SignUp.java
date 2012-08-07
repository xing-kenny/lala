package org.kenny.drillmgt.domain;

import java.io.Serializable;
import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.Table;

@Table("t_signup")
public class SignUp implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5453437700859031714L;

	@Id
	private int id;

	@Column
	private int courseId;

	@Column
	private int signerId;

	@Column
	private Date signUpDay;

	@Column
	private int checkInId;

	@One(target = Account.class, field = "signerId")
	private Account signer;

	@One(target = CheckIn.class, field = "checkInId")
	private CheckIn checkIn;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getSignerId() {
		return signerId;
	}

	public void setSignerId(int signerId) {
		this.signerId = signerId;
	}

	public Date getSignUpDay() {
		return signUpDay;
	}

	public void setSignUpDay(Date signUpDay) {
		this.signUpDay = signUpDay;
	}

	public int getCheckInId() {
		return checkInId;
	}

	public void setCheckInId(int checkInId) {
		this.checkInId = checkInId;
	}

	public Account getSigner() {
		return signer;
	}

	public void setSigner(Account signer) {
		this.signer = signer;
	}

	public CheckIn getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(CheckIn checkIn) {
		this.checkIn = checkIn;
	}

}
