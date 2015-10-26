package dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Place {

	private int placeNo;
	private String placeName;
	private String placeAddress;
	private String placePhone;
	private String placePositionX;
	private String placePositionY;
	private String placeComment;
	private int like;
	private boolean placeCert;
	public boolean isPlaceCert() {
		return placeCert;
	}

	public void setPlaceCert(boolean placeCert) {
		this.placeCert = placeCert;
	}

	private String memberId;
	private List<String> imageUrlUrl;
	private List<String> imageFileUrl;
	public List<String> getImageFileUrl() {
		return imageFileUrl;
	}

	public void setImageFileUrl(List<String> imageFileUrl) {
		this.imageFileUrl = imageFileUrl;
	}

	private List<String> placeCategory;
	private List<MultipartFile> imageFile;

	

	public Place() {

	}

	public Place(int placeNo, String placeName, String placeAddress, String placePhone, String placePositionX,
			String placePositionY, String placeComment, int like,  String memberId, boolean placeCert,
			List<String> imageUrlUrl, List<String> placeCategory, List<MultipartFile> imageFile) {
		super();
		this.placeNo = placeNo;
		this.placeName = placeName;
		this.placeAddress = placeAddress;
		this.placePhone = placePhone;
		this.placePositionX = placePositionX;
		this.placePositionY = placePositionY;
		this.placeComment = placeComment;
		this.like = like;
		this.placeCert = placeCert;
		this.memberId = memberId;
		this.imageUrlUrl = imageUrlUrl;
		this.placeCategory = placeCategory;
		this.imageFile = imageFile;
	}

	public Place(String placeName, String placeAddress, String placePhone, String placePositionX, String placePositionY,
			String placeComment, boolean placeCert, String memberId) {
		super();
		this.placeName = placeName;
		this.placeAddress = placeAddress;
		this.placePhone = placePhone;
		this.placePositionX = placePositionX;
		this.placePositionY = placePositionY;
		this.placeComment = placeComment;
		this.placeCert = placeCert;
		this.memberId = memberId;

	}
	public Place( String placePhone,String placeComment,int placeNo) {
		super();
		
		this.placePhone = placePhone;
		this.placeComment = placeComment;
		this.placeNo = placeNo;
	}
	

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getPlaceAddress() {
		return placeAddress;
	}

	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}

	public String getPlacePhone() {
		return placePhone;
	}

	public void setPlacePhone(String placePhone) {
		this.placePhone = placePhone;
	}

	public String getPlacePositionX() {
		return placePositionX;
	}

	public void setPlacePositionX(String placePositionX) {
		this.placePositionX = placePositionX;
	}

	public String getPlacePositionY() {
		return placePositionY;
	}

	public void setPlacePositionY(String placePositionY) {
		this.placePositionY = placePositionY;
	}

	public String getPlaceComment() {
		return placeComment;
	}

	public void setPlaceComment(String placeComment) {
		this.placeComment = placeComment;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public List<String> getImageUrlUrl() {
		return imageUrlUrl;
	}

	public void setImageUrlUrl(List<String> imageUrlUrl) {
		this.imageUrlUrl = imageUrlUrl;
	}

	public List<String> getPlaceCategory() {
		return placeCategory;
	}

	public void setPlaceCategory(List<String> placeCategory) {
		this.placeCategory = placeCategory;
	}

	public List<MultipartFile> getImageFile() {
		return imageFile;
	}

	public void setImageFile(List<MultipartFile> imageFile) {
		this.imageFile = imageFile;
	}
	@Override
	public String toString() {
		return "Place [placeNo=" + placeNo + ", placeName=" + placeName + ", placeAddress=" + placeAddress
				+ ", placePhone=" + placePhone + ", placePositionX=" + placePositionX + ", placePositionY="
				+ placePositionY + ", placeComment=" + placeComment + ", like=" + like + ", placeCert=" + placeCert
				+ ", memberId=" + memberId + ", imageUrlUrl=" + imageUrlUrl + ", imageFileUrl=" + imageFileUrl
				+ ", placeCategory=" + placeCategory + ", imageFile=" + imageFile + "]";
	}

}
