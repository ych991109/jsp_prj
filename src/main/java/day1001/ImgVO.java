package day1001;

public class ImgVO {
	private String img;
	private String info;
	
	public ImgVO() {
		
	}
	public ImgVO(String img, String info) {
		super();
		this.img = img;
		this.info = info;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	@Override
	public String toString() {
		return "imgVO [img=" + img + ", info=" + info + ", getImg()=" + getImg() + ", getInfo()=" + getInfo()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
}
