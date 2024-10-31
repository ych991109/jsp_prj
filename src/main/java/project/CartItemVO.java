package project;

public class CartItemVO {
    private int id; // 상품 ID
    private String name; // 상품 이름
    private String image; // 상품 이미지 URL
    private int price; // 상품 가격
    private int quantity; // 수량
    private OptionVO options; // 옵션 (예: 사이즈, 컵 등)

    // 생성자
    public CartItemVO(int id, String name, String image, int price, int quantity, OptionVO options) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.options = options;
    }

    // Getter 및 Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public OptionVO getOptions() { return options; }
    public void setOptions(OptionVO options) { this.options = options; }
}
