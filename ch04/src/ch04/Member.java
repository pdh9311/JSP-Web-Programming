package ch04;

import java.io.Serializable;

/* 자바빈즈로 사용하기 위해서는
 * 1. Serializable 인터페이스를 구현하고 있어야 한다. 하지만 생략 할 수 도 있다.
 * 2. 인수가 없는 기본생성자가 있어야 한다.
 * 3. 모든 멤버 변수는 private 접근 지정자로 설정해야한다.
 * 4. 모든 멤버 변수의 Getter/Setter 메소드가 있어야 한다. */
public class Member implements Serializable {
	private String id;
	private String pw;
	private int age;
	
	public Member() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
}
