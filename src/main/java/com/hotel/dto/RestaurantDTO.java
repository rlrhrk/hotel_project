package com.hotel.dto;

import org.apache.ibatis.type.Alias;

@Alias("restaurant")
public class RestaurantDTO {
	private String restaurantNo;
	private String restaurantImagepath;
	private int restaurantTypeNo;
	private String restaurantManual;
	private String restaurantType;
	private String restaurantBookingNo;
	private String hotelNo;
	private String time;
	private String nowDate;
	private String bookingDate;
	private String hotelName;
	private String restaurantPrice;
	private String email;
	private int personCount;
	private String mealType;
	
	
	

	public RestaurantDTO() {
		
	}




	public String getRestaurantNo() {
		return restaurantNo;
	}




	public void setRestaurantNo(String restaurantNo) {
		this.restaurantNo = restaurantNo;
	}




	public String getRestaurantImagepath() {
		return restaurantImagepath;
	}




	public void setRestaurantImagepath(String restaurantImagepath) {
		this.restaurantImagepath = restaurantImagepath;
	}




	public int getRestaurantTypeNo() {
		return restaurantTypeNo;
	}




	public void setRestaurantTypeNo(int restaurantTypeNo) {
		this.restaurantTypeNo = restaurantTypeNo;
	}




	public String getRestaurantManual() {
		return restaurantManual;
	}




	public void setRestaurantManual(String restaurantManual) {
		this.restaurantManual = restaurantManual;
	}




	public String getRestaurantType() {
		return restaurantType;
	}




	public void setRestaurantType(String restaurantType) {
		this.restaurantType = restaurantType;
	}




	public String getRestaurantBookingNo() {
		return restaurantBookingNo;
	}




	public void setRestaurantBookingNo(String restaurantBookingNo) {
		this.restaurantBookingNo = restaurantBookingNo;
	}




	public String getHotelNo() {
		return hotelNo;
	}




	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}




	public String getTime() {
		return time;
	}




	public void setTime(String time) {
		this.time = time;
	}




	public String getNowDate() {
		return nowDate;
	}




	public void setNowDate(String nowDate) {
		this.nowDate = nowDate;
	}




	public String getBookingDate() {
		return bookingDate;
	}




	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}




	public String getHotelName() {
		return hotelName;
	}




	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}




	public String getRestaurantPrice() {
		return restaurantPrice;
	}




	public void setRestaurantPrice(String restaurantPrice) {
		this.restaurantPrice = restaurantPrice;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public int getPersonCount() {
		return personCount;
	}




	public void setPersonCount(int personCount) {
		this.personCount = personCount;
	}




	public String getMealType() {
		return mealType;
	}




	public void setMealType(String mealType) {
		this.mealType = mealType;
	}




	@Override
	public String toString() {
		return "RestaurantDTO [restaurantNo=" + restaurantNo + ", restaurantImagepath=" + restaurantImagepath
				+ ", restaurantTypeNo=" + restaurantTypeNo + ", restaurantManual=" + restaurantManual
				+ ", restaurantType=" + restaurantType + ", restaurantBookingNo=" + restaurantBookingNo + ", hotelNo="
				+ hotelNo + ", time=" + time + ", nowDate=" + nowDate + ", bookingDate=" + bookingDate + ", hotelName="
				+ hotelName + ", restaurantPrice=" + restaurantPrice + ", email=" + email + ", personCount="
				+ personCount + ", mealType=" + mealType + "]";
	}
	
	
	}

