package com.hotel;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.dto.BookingDTO;
import com.hotel.dto.HotelDTO;
import com.hotel.dto.RestaurantDTO;
import com.hotel.dto.RoomDTO;
import com.hotel.service.MainService;

@Controller
public class MainController {
	private MainService mainservice;

	public MainController(MainService mainservice) {
		this.mainservice = mainservice;
	}
	
	@RequestMapping("/")
	public String mainpage(Model model) {
		List<RoomDTO> mainlist = mainservice.selectMainView();
		System.out.println(mainlist);
		System.out.println(mainlist.size());
		model.addAttribute("mainlist", mainlist);
		return "index";
	}
	
	@RequestMapping("/hotelDetailView.do")
	public String hotelDetailView(Model model) {
		List<HotelDTO> hotellist = mainservice.selectHotelView();
		System.out.println(hotellist);
		model.addAttribute("hotellist", hotellist);
		return "hotel_detail_view";
	}
	
	@RequestMapping("/roomDetailView.do")
	public String roomDetailView(Model model) {
		List<RoomDTO> roomlist = mainservice.selectRoomView();
		List<HotelDTO> hotellist = mainservice.selectHotelView();
		System.out.println(roomlist);
		System.out.println(hotellist);
		model.addAttribute("roomlist", roomlist);
		model.addAttribute("hotellist", hotellist);
		return "room_detail_view";
	}
	
	@RequestMapping("diningView.do")
	public String diningpage(Model model) {
		List<RestaurantDTO> restaurantlist = mainservice.selectRestaurantView();
		List<HotelDTO> hotellist = mainservice.selectHotelView();
		System.out.println(restaurantlist);
		System.out.println(hotellist);
		model.addAttribute("restaurantlist", restaurantlist);
		model.addAttribute("hotellist", hotellist);
		return "diningpage";
	}
	
	@RequestMapping("/selectRestaurantType.do")
	public ResponseEntity<List<RestaurantDTO>> selectRestaurantType(String hotelNo) {
		List<RestaurantDTO> rlist = mainservice.selectRestaurantType(hotelNo);
		return ResponseEntity.ok(rlist);
	}
	
	@RequestMapping("/resbooking.do")
	public String insertresbookingInfo(RestaurantDTO dto) {
			System.out.println(dto.getRestaurantNo());
			String bookingDate = dto.getBookingDate().replace("/", "");
			dto.setBookingDate(bookingDate);
			dto.setRestaurantPrice("15000");
			System.out.println("asdasfas" + dto.toString());
			mainservice.insertresbookingInfo(dto);
			return"redirect:/";
		
	}
}
