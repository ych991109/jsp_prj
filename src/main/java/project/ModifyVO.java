package project;

public class ModifyVO {
    private String email;       // 사용자의 이메일
    private String password;    // 사용자의 비밀번호
    private String name;        // 사용자의 이름
    private String zipcode;     // 사용자의 우편번호
    private String address;     // 사용자의 주소
    private String address2;    // 사용자의 추가 주소

    // 기본 생성자
    public ModifyVO() {}

    // 매개변수가 있는 생성자
    public ModifyVO(String email, String password, String name, String zipcode, String address, String address2) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.zipcode = zipcode;
        this.address = address;
        this.address2 = address2;
    }

    // Getter와 Setter 메소드
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getZipcode() { return zipcode; }
    public void setZipcode(String zipcode) { this.zipcode = zipcode; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getAddress2() { return address2; }
    public void setAddress2(String address2) { this.address2 = address2; }

    // 객체 정보를 문자열로 표현
    @Override
    public String toString() {
        return "ModifyVO{" +
                "email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", address='" + address + '\'' +
                ", address2='" + address2 + '\'' +
                '}';
    }

    // equals 메소드 재정의
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;  // 참조가 동일한 경우
        if (!(obj instanceof ModifyVO)) return false;  // 타입 확인
        ModifyVO that = (ModifyVO) obj;  // 형변환
        return email.equals(that.email) && password.equals(that.password);  // 이메일과 비밀번호가 같은지 비교
    }

    // hashCode 메소드 재정의
    @Override
    public int hashCode() {
        return 31 * email.hashCode() + password.hashCode();  // 해시코드 계산
    }
}
