package project;

public class ModifyVO {
    private String email;
    private String password;
    private String name;
    private String zipcode;
    private String address;
    private String address2;

    // 기본 생성자
    public ModifyVO() {}

    public ModifyVO(String email, String password, String name, String zipcode, String address, String address2) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.zipcode = zipcode;
        this.address = address;
        this.address2 = address2;
    }

    // Getters and setters
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

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof ModifyVO)) return false;
        ModifyVO that = (ModifyVO) obj;
        return email.equals(that.email) && password.equals(that.password);
    }

    @Override
    public int hashCode() {
        return 31 * email.hashCode() + password.hashCode();
    }
}
