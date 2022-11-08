package kr.ac.kopo.Model;

public class Product {

	private int id;
	private String name;
	private String price;
	private String img;
	private String url;
	private int shoppingmallId;
	private String userId;
	private String shopName;
	
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getShoppingmallId() {
		return shoppingmallId;
	}
	public void setShoppingmallId(int shoppingmallId) {
		this.shoppingmallId = shoppingmallId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}



}
