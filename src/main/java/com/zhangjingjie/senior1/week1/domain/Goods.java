package com.zhangjingjie.senior1.week1.domain;

public class Goods {
	
	
	private Integer gid;
	
	private String gname;
	
	private String gEnglishName;
	
	private Integer bid;
	
	private Integer kid;
	
	private Integer size;
	
	private Double price;
	
	private Integer gnum;
	
	private String glabel;
	
	private String image;
	
	private Brand brand;
	
	private Kind kind;

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getgEnglishName() {
		return gEnglishName;
	}

	public void setgEnglishName(String gEnglishName) {
		this.gEnglishName = gEnglishName;
	}

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public Integer getKid() {
		return kid;
	}

	public void setKid(Integer kid) {
		this.kid = kid;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getGnum() {
		return gnum;
	}

	public void setGnum(Integer gnum) {
		this.gnum = gnum;
	}

	public String getGlabel() {
		return glabel;
	}

	public void setGlabel(String glabel) {
		this.glabel = glabel;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Kind getKind() {
		return kind;
	}

	public void setKind(Kind kind) {
		this.kind = kind;
	}

	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", gname=" + gname + ", gEnglishName=" + gEnglishName + ", bid=" + bid + ", kid="
				+ kid + ", size=" + size + ", price=" + price + ", gnum=" + gnum + ", glabel=" + glabel + ", image="
				+ image + ", brand=" + brand + ", kind=" + kind + "]";
	}
	
	
}
