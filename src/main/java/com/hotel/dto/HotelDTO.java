package com.hotel.dto;

import org.apache.ibatis.type.Alias;

@Alias("hotel")
public class HotelDTO {
	private String hotelNo;
	private String hotelName;
	private String hotelTel;
	private String hotelAddress;
	private String hotelImage;
	private String hotelSimpleManual;
	private String hotelDetailManual;
	private int hotelAllRoomEA;

	public HotelDTO() {
	}
	
	

	public int getHotelAllRoomEA() {
		return hotelAllRoomEA;
	}



	public void setHotelAllRoomEA(int hotelAllRoomEA) {
		this.hotelAllRoomEA = hotelAllRoomEA;
	}



	public String getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getHotelTel() {
		return hotelTel;
	}

	public void setHotelTel(String hotelTel) {
		this.hotelTel = hotelTel;
	}

	public String getHotelAddress() {
		return hotelAddress;
	}

	public void setHotelAddress(String hotelAddress) {
		this.hotelAddress = hotelAddress;
	}

	public String getHotelImage() {
		return hotelImage;
	}

	public void setHotelImage(String hotelImage) {
		this.hotelImage = hotelImage;
	}

	public String getHotelSimpleManual() {
		return hotelSimpleManual;
	}

	public void setHotelSimpleManual(String hotelSimpleManual) {
		this.hotelSimpleManual = hotelSimpleManual;
	}

	public String getHotelDetailManual() {
		return hotelDetailManual;
	}

	public void setHotelDetailManual(String hotelDetailManual) {
		this.hotelDetailManual = hotelDetailManual;
	}

	@Override
	public String toString() {
		return "HotelDTO [hotelNo=" + hotelNo + ", hotelName=" + hotelName + ", hotelTel=" + hotelTel
				+ ", hotelAddress=" + hotelAddress + ", hotelImage=" + hotelImage + ", hotelSimpleManual="
				+ hotelSimpleManual + ", hotelDetailManual=" + hotelDetailManual + "]";
	}
	
	
	
}
