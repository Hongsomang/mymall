package kr.ac.kopo.Model;

public class Parsing {

	private String name;
	private String price;
	private String img;
	private String url;
	private int shoppingmallId;

	public Parsing(String name, String price,String img, String url,int shoppingmallId) {
		this.name=name;
		this.price=price;
		this.img=img;
		this.url=url;
		this.shoppingmallId=shoppingmallId;
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

	@Override
	public String toString() {
		return "[name="+name+"] "+"[price="+price+"] "+"[img="+img+"] "+"[url="+url+"] "+"[shoppingmallId="+shoppingmallId+"]";
	}

}
