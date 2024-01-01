package model;

public class ProductImages {
	private int id;
	private int pid;
	private String image;
	
	public ProductImages(int pid, String image) {
		this.pid = pid;
		this.image = image;
	}

	public ProductImages(int id, int pid, String image) {
		super();
		this.id = id;
		this.pid = pid;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
}
