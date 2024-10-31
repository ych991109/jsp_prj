package project;

public class OptionVO {
    private String size; // 사이즈
    private String cup; // 컵
    private boolean choco; // 초코 추가 여부
    private boolean strawberry; // 딸기 추가 여부

    // 생성자
    public OptionVO(String size, String cup, boolean choco, boolean strawberry) {
        this.size = size;
        this.cup = cup;
        this.choco = choco;
        this.strawberry = strawberry;
    }

    // Getter 및 Setter
    public String getSize() { return size; }
    public void setSize(String size) { this.size = size; }
    public String getCup() { return cup; }
    public void setCup(String cup) { this.cup = cup; }
    public boolean isChoco() { return choco; }
    public void setChoco(boolean choco) { this.choco = choco; }
    public boolean isStrawberry() { return strawberry; }
    public void setStrawberry(boolean strawberry) { this.strawberry = strawberry; }
}
