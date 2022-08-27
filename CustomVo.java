package vo;

import java.sql.Date;

//TBL_CUSTOM 테이블의 컬럼값을 저장할 필드 선언합니다.
public class CustomVo {
	private String custom_id;
	private String name;
	private String email;
	private int age;
	private Date reg_date;
	
	public CustomVo() {
	//초기화 작업에 필요한 내용 작성 가능합니다.
	}
	
	
	public CustomVo(String custom_id, String name, String email, int age, Date reg_date) {
		super();
		this.custom_id = custom_id;
		this.name = name;
		this.email = email;
		this.age = age;
		this.reg_date = reg_date;
	}

	//toString 재정의
	@Override
	public String toString() {
		return "CustomVo [custom_id=" + custom_id + ", name=" + name + ", email=" + email + ", age=" + age
				+ ", reg_date=" + reg_date + "]";
	}
	
	//getter,setter
	public String getCustom_id() {
		return custom_id;
	}
	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}