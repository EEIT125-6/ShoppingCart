
package com.demo.entities;

public class Product {  //資料庫內項目資料型態
	
	private String id;
	private String name;
	private Integer price;
	private String photo;

	public Product() {
	}

	public Product(String id, String name, String photo, Integer price) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.photo = photo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	

}
