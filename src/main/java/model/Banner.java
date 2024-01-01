package model;

public class Banner {
	private int id;
	private String name;
	private String img;
	private String link;
	
	
	public Banner(int id, String name, String img, String link) {
		this.id = id;
		this.name = name;
		this.img = img;
		this.link = link;
	}
	
	public Banner() {

	}
	
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
	
}
