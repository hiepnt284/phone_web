package model;

import java.sql.Date;

public class Products {
	private int id;
	private String name;
	private double price;
	private Date releaseDate;
	private String describe,image;
	private Category category;
	
	public Products() {
	}
	
	
	
	public Products(int id, String name, double price, Date releaseDate, String describe) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.releaseDate = releaseDate;
		this.describe = describe;
	}



	public Products(String name, double price, Date releaseDate, String describe, String image, Category category) {
		this.name = name;
		this.price = price;
		this.releaseDate = releaseDate;
		this.describe = describe;
		this.image = image;
		this.category = category;
	}

	public Products(int id, String name, double price, Date releaseDate, String describe, String image,
			Category category) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.releaseDate = releaseDate;
		this.describe = describe;
		this.image = image;
		this.category = category;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Products [id=" + id + ", name=" + name + ", price=" + price + ", releaseDate=" + releaseDate
				+ ", describe=" + describe + ", image=" + image + ", category=" + category + "]";
	}
	
	
}