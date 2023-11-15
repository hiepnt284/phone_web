package model;


public class OrderDetail {
	private int pid;
	private String name;
	private String image;
	private int oid;
	private int quantity;
	private double price;
	
	public OrderDetail() {
	}

	public OrderDetail(int pid, int oid, int quantity, double price) {
		this.pid = pid;
		this.oid = oid;
		this.quantity = quantity;
		this.price = price;
	}

	public OrderDetail(int pid, String name, String image, int oid, int quantity, double price) {
		this.pid = pid;
		this.name = name;
		this.image = image;
		this.oid = oid;
		this.quantity = quantity;
		this.price = price;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
