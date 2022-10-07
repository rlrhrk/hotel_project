package com.hotel;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.dto.BookingDTO;
import com.hotel.dto.HotelDTO;
import com.hotel.service.BookingService;

@Controller
public class BookingController {
	private BookingService bookingservice;
	
	
	public BookingController(BookingService bookingservice) {
		this.bookingservice = bookingservice;
	}
// -------------------------------------------------------------동희------------------------------------------------------
	// 위시리스트
	@RequestMapping("wishlist.do")
	public String wishlist(Model model, HttpSession session) {
		String email = (String) session.getAttribute("email");
		List<BookingDTO> wishlist = bookingservice.selectWishlistView(email);
//		System.out.println(wishlist.toString());
//		System.out.println(wishlist.size());
		model.addAttribute("wishlist", wishlist);
		return "dh/wishlist";
	}
	
	@RequestMapping("/bookingView.do")
	public String bookingView(Model model, HttpSession session, String roomNo) {
		String email = (String) session.getAttribute("email"); 
		List<BookingDTO> roomlist = bookingservice.selectBookingView(roomNo);
		
		System.out.println("room1234"+roomlist.toString());
		model.addAttribute("roomlist", roomlist);
		return "dh/booking";
	}
	
	
	// 객실예약
	@RequestMapping("/booking.do")
	public String insertBooking(BookingDTO bdto, String checkInOut) {
		System.out.println(checkInOut);
		String[] arr = checkInOut.split(" - ");
		String checkIn = arr[0];
		String checkOut = arr[1];
		checkIn = checkIn.replace("/", "");
		checkOut = checkOut.replace("/", "");
		bdto.setCheckIn(checkIn);
		bdto.setCheckOut(checkOut);
		System.out.println(bdto);
		bookingservice.insertRoomBooking(bdto);
		return "redirect:/";
	}


//-------------------------------------------------------------동희------------------------------------------------------


//-------------------------------------------------------------용성------------------------------------------------------

	//예약가능 객실검색 페이지이동
	@RequestMapping("/searchRoom.do")
	public String searchRoom(Model model) {
		List<HotelDTO> hotel = bookingservice.selectHotel();
		
		model.addAttribute("hotel", hotel);
		return "ys/searchRoom";
	}
	//예약가능 객실검색
	@RequestMapping("/search.do")
	public ResponseEntity<List<BookingDTO>> search(BookingDTO bdto) {
		List<BookingDTO> room = bookingservice.searchRoom(bdto);
		System.out.println("1234"+room);
		return ResponseEntity.ok(room);
	}
	//찜하기
	@RequestMapping("/insertWishlist.do")
	public void insertWishlist(BookingDTO bdto, HttpServletResponse response, HttpSession session) throws IOException {
		String email = (String) session.getAttribute("email");
		bdto.setEmail(email);
		System.out.println(bdto);
		int result = bookingservice.insertWishlist(bdto);
		response.setContentType("text/html;charset=utf-8");
		if(result == 0)
			response.getWriter().write("<script>alert('찜하기 실패');location.href='searchRoom.do';</script>");
		else
			response.getWriter().write("<script>alert('찜하기 완료');location.href='searchRoom.do';</script>");
	}

//-------------------------------------------------------------용성------------------------------------------------------


}