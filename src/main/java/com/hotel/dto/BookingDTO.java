package com.hotel.dto;

import org.apache.ibatis.type.Alias;

@Alias("booking")
public class BookingDTO {
	private String roomNo;
	private String email;
	private String bookingDate;
	private String checkIn;
	private String checkOut;
	private int roomStatus;
	private int price;
	private String wishlistNo;
	private String hotelNo;
	private String roomType;
	private String roomsimplemanual;
	private String roomdetailmanual;
	private String roomimage;
	private int total;
	private String hotelName;
	
	public BookingDTO() {
	}
	
	public BookingDTO(String checkIn, String checkOut, String hotelNo) {
		super();
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.hotelNo = hotelNo;
	}
	
	
	
	
	
	public BookingDTO(String roomNo, String email, String bookingDate, String checkIn, String checkOut, int roomStatus,
			int price, String wishlistNo, String hotelNo, String roomType, String roomsimplemanual,
			String roomdetailmanual, String roomimage, int total, String hotelName) {
		super();
		this.roomNo = roomNo;
		this.email = email;
		this.bookingDate = bookingDate;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.roomStatus = roomStatus;
		this.price = price;
		this.wishlistNo = wishlistNo;
		this.hotelNo = hotelNo;
		this.roomType = roomType;
		this.roomsimplemanual = roomsimplemanual;
		this.roomdetailmanual = roomdetailmanual;
		this.roomimage = roomimage;
		this.total = total;
		this.hotelName = hotelName;
	}
	
	
	public String getRoomimage() {
		return roomimage;
	}

	public void setRoomimage(String roomimage) {
		this.roomimage = roomimage;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public int getTotal() {
		return total;
	}



	public void setTotal(int total) {
		this.total = total;
	}



	public String getRoomNo() {
		return roomNo;
	}
	
	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public int getRoomStatus() {
		return roomStatus;
	}

	public void setRoomStatus(int roomStatus) {
		this.roomStatus = roomStatus;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getWishlistNo() {
		return wishlistNo;
	}

	public void setWishlistNo(String wishlistNo) {
		this.wishlistNo = wishlistNo;
	}

	public String getHotelNo() {
		return hotelNo;
	}


	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}

	public String getRoomType() {
		return roomType;
	}


	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}



	public String getRoomsimplemanual() {
		return roomsimplemanual;
	}



	public void setRoomsimplemanual(String roomsimplemanual) {
		this.roomsimplemanual = roomsimplemanual;
	}



	public String getRoomdetailmanual() {
		return roomdetailmanual;
	}



	public void setRoomdetailmanual(String roomdetailmanual) {
		this.roomdetailmanual = roomdetailmanual;
	}

	@Override
	public String toString() {
		return "BookingDTO [roomNo=" + roomNo + ", email=" + email + ", bookingDate=" + bookingDate + ", checkIn="
				+ checkIn + ", checkOut=" + checkOut + ", roomStatus=" + roomStatus + ", price=" + price
				+ ", wishlistNo=" + wishlistNo + ", hotelNo=" + hotelNo + ", roomType=" + roomType
				+ ", roomsimplemanual=" + roomsimplemanual + ", roomdetailmanual=" + roomdetailmanual + ", roomimage="
				+ roomimage + ", total=" + total + ", hotelName=" + hotelName + "]";
	}	
	

	
	
}
