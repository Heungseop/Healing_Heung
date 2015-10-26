package dto;

public class ImageUrl {
	private int imageUrlNo;
	private String imageUrlUrl;
	private int placeNo;
	private String imageUrlFile;
	public ImageUrl() {
		super();
		
	}
	public ImageUrl(int imageUrlNo, String imageUrlUrl, int placeNo, String imageUrlFile) {
		super();
		this.imageUrlNo = imageUrlNo;
		this.imageUrlUrl = imageUrlUrl;
		this.placeNo = placeNo;
		this.imageUrlFile = imageUrlFile;
	}
	public ImageUrl(String imageUrlUrl, int placeNo, String imageUrlFile) {
		super();
		this.imageUrlUrl = imageUrlUrl;
		this.placeNo = placeNo;
		this.imageUrlFile = imageUrlFile;
	}
	public ImageUrl(int placeNo, String imageUrlFile) {
		super();
		this.placeNo = placeNo;
		this.imageUrlFile = imageUrlFile;
	}
	public ImageUrl(String imageUrlUrl, int placeNo) {
		super();
		this.imageUrlUrl = imageUrlUrl;
		this.placeNo = placeNo;
	}

	public int getImageUrlNo() {
		return imageUrlNo;
	}
	public void setImageUrlNo(int imageUrlNo) {
		this.imageUrlNo = imageUrlNo;
	}
	public String getImageUrlUrl() {
		return imageUrlUrl;
	}
	public void setImageUrlUrl(String imageUrlUrl) {
		this.imageUrlUrl = imageUrlUrl;
	}
	public int getPlaceNo() {
		return placeNo;
	}
	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}
	public String getImageUrlFile() {
		return imageUrlFile;
	}
	public void setImageUrlFile(String imageUrlFile) {
		this.imageUrlFile = imageUrlFile;
	}
	@Override
	public String toString() {
		return "ImageUrl [imageUrlNo=" + imageUrlNo + ", imageUrlUrl=" + imageUrlUrl + ", placeNo=" + placeNo
				+ ", imageUrlFile=" + imageUrlFile + "]";
	}
	
}
