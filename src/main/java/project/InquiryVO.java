package project;

import java.util.Date;
import java.util.Objects;

public class InquiryVO {
    private int id;
    private String type, usagePath, visitDate, notification, name, phone, email, title, content, status;
    private Date input_date; // Date 타입으로 변경하고 이름을 input_date로 설정

    public InquiryVO() {}

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getInput_date() { // 메서드 이름 변경
        return input_date;
    }

    public void setInput_date(Date input_date) { // 메서드 이름 변경
        this.input_date = input_date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUsagePath() {
        return usagePath;
    }

    public void setUsagePath(String usagePath) {
        this.usagePath = usagePath;
    }

    public String getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(String visitDate) {
        this.visitDate = visitDate;
    }

    public String getNotification() {
        return notification;
    }

    public void setNotification(String notification) {
        this.notification = notification;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "InquiryVO{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", usagePath='" + usagePath + '\'' +
                ", visitDate='" + visitDate + '\'' +
                ", notification='" + notification + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", input_date=" + input_date + // 수정
                ", status='" + status + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof InquiryVO)) return false;
        InquiryVO inquiryVO = (InquiryVO) o;
        return id == inquiryVO.id &&
                Objects.equals(type, inquiryVO.type) &&
                Objects.equals(usagePath, inquiryVO.usagePath) &&
                Objects.equals(visitDate, inquiryVO.visitDate) &&
                Objects.equals(notification, inquiryVO.notification) &&
                Objects.equals(name, inquiryVO.name) &&
                Objects.equals(phone, inquiryVO.phone) &&
                Objects.equals(email, inquiryVO.email) &&
                Objects.equals(title, inquiryVO.title) &&
                Objects.equals(content, inquiryVO.content) &&
                Objects.equals(input_date, inquiryVO.input_date) && // 수정
                Objects.equals(status, inquiryVO.status);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, type, usagePath, visitDate, notification, name, phone, email, title, content, input_date, status);
    }
}
