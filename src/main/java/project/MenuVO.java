package project;

public class MenuVO {
    private int id;          // 메뉴 ID
    private String name;     // 메뉴명
    private String imageUrl; // 이미지 URL
    private double price;    // 가격

    // 기본 생성자
    public MenuVO() {}

    // 모든 속성을 포함하는 생성자
    public MenuVO(int id, String name, String imageUrl, double price) {
        this.id = id;
        this.name = name;
        this.imageUrl = imageUrl;
        this.price = price;
    }

    // Getter 및 Setter 메소드
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
