package kr.ac.kopo.Model;

import java.util.ArrayList;
import java.util.List;

public class Pager {

	private String search;
	private int page=1;
	private int perPager=32;
	private float total;
	final int perGroup=5;
	private int shoppingmallId;
	private String userId;
	private String type;

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}


	public int getPerPager() {
		return perPager;
	}

	public void setPerPager(int perPager) {
		this.perPager = perPager;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getPerGroup() {
		return perGroup;
	}

	public int getPrev() {
		return page<=perGroup ?1:((page-1)/perGroup)*perGroup;// 9/5=1, 1*5=5
	}
	public int getNext() {
		int next= (((page-1)/perGroup)+1)*perGroup+1;// 9/5=1, 1+1=2, 2*5=10, 10+1=11
		int last=getLast();
		return next<last? next:last;
	}
	public int getLast() {
		return (int)Math.ceil(total/perPager); //Math.ceil ->올림
	}

	public List<Integer> getList(){
		List<Integer> list =new ArrayList<>();
		int startPage=((page-1)/perGroup)*perGroup+1; //page=1일떄 ((1-1)/5)*5+1=1
		for(int count=startPage;count<(startPage+perGroup)&&count<=getLast();count++) {//1~5 6~10으로 버튼이 생김
			list.add(count);
		}
		if(list.isEmpty()) {//리스트 비었을 떄 page 버튼 한개만 생성
			list.add(1);
		}
		return list;
	}

	public int getOffset() {
		return (page-1)*perPager; //LIMIT함수가 정한 수의 다음 수 부터 나옴
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	

}
