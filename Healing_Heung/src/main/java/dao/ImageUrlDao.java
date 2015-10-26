package dao;

import dto.ImageUrl;

public interface ImageUrlDao {
	public int insertImageUrl(ImageUrl imageurl);
	
	public int insertImageFileUrl(ImageUrl imageurl);
	
	public int deleteImageByPlaceNo(int placeNo);
}
