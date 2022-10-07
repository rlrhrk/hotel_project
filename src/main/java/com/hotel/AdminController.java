package com.hotel;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hotel.dto.HotelDTO;
import com.hotel.dto.MemberDTO;
import com.hotel.dto.QnADTO;
import com.hotel.dto.RestaurantDTO;
import com.hotel.dto.RoomDTO;
import com.hotel.service.HotelService;
import com.hotel.service.MemberService;
import com.hotel.service.QnAService;
import com.hotel.service.RestaurantService;
import com.hotel.service.RoomService;
import com.hotel.vo.PaggingVO;

@Controller
public class AdminController {
	private HotelService hotelservice;
	private RoomService roomservice;
	private MemberService memberservice;
	private QnAService qnaservice;
	private RestaurantService restaurantservice;
	
	public AdminController(HotelService hotelservice, RoomService roomservice, MemberService memberservice,
			QnAService qnaservice, RestaurantService restaurantservice) {
		this.hotelservice = hotelservice;
		this.roomservice = roomservice;
		this.memberservice = memberservice;
		this.qnaservice = qnaservice;
		this.restaurantservice = restaurantservice;
	}

	@RequestMapping("/admin.do")
	public String main(Model model) {
		
		// 성별 비율 구하는 부분
		String gender = "F";
		int fcount = memberservice.selectGenderCount(gender);
		gender = "M";
		int mcount = memberservice.selectGenderCount(gender);
		System.out.println(fcount);
		System.out.println(mcount);
		// 올해 달별 호텔별 예약 수
		LocalDate now = LocalDate.now();
		int nowMonth = now.getMonth().getValue();
//		int[] monthcount = new int[12];
		List<Integer> monthcount = new ArrayList<Integer>();
		
		for(int i=1;i<=nowMonth;i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("thismonth", String.valueOf(i));
			map.put("nextmonth", String.valueOf(i+1));
			if(map.get("thismonth").length() == 1) {
				map.put("thismonth", "0"+ map.get("thismonth"));
			}
			System.out.println(map.get("thismonth"));
			System.out.println(map.get("nextmonth"));
			model.addAttribute("m"+ String.valueOf(i) +"count", memberservice.selectMonthCount(map));
		}
		
		model.addAttribute("fcount", fcount);
		
		model.addAttribute("mcount", mcount);
		model.addAttribute("title", "메인 페이지");
		model.addAttribute("page", "mainView.jsp" );
		
		return "es/admin_main";
	}
	
	@RequestMapping("/selectAllHotel.do")
	public String selectAllHotel(Model model) {
		List<HotelDTO> list = hotelservice.selectAllHotel();
		
		// 정보확인
		for(int i=0;i<list.size();i++) {
//			System.out.println(list.get(i).toString());
			// 전화번호 형식 변환부
			String tel = list.get(i).getHotelTel();
			if(tel.length() == 8){
				list.get(i).setHotelTel(tel.replaceFirst("^([0-9]{4})([0-9]{4})$", "$1-$2"));
			}
			else if(tel.length()==12) {
				list.get(i).setHotelTel(tel.replaceFirst("(^[0-9]{4})([0-9]{4})([0-9]{4})$","$1-$2-$3"));
			}else{
			list.get(i).setHotelTel(tel.replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$","$1-$2-$3"));
			}
			
			// 호텔 전체 객실 개수 구하는 부분
			int allEa = hotelservice.selectAllEa(list.get(i).getHotelNo());
			list.get(i).setHotelAllRoomEA(allEa);
		}
		
		model.addAttribute("title", "전체 지점 관리");
		model.addAttribute("page", "allHotelView.jsp" );
		model.addAttribute("list", list);
		
		return "es/admin_main";
	}
	
	@RequestMapping("/insertHotelView.do")
	public String insertHotelView(Model model) {
		
		model.addAttribute("title", "호텔 지점 등록");
		model.addAttribute("page", "insertHotelView.jsp" );
		
		return "es/admin_main";
	}
	
	@RequestMapping("/insertHotel.do")
	public String insertHotel(HotelDTO dto, String addr1, String addr2, String addr3,
			Model model, MultipartHttpServletRequest request
			) throws IOException{
		
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////

		File userRoot = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\");
		String encoding = "utf-8";
		
		if(!userRoot.exists())
			userRoot.mkdirs();
		
		List<MultipartFile> filelist = request.getFiles("file");
		int i = 1;
		for(MultipartFile f : filelist) {
			String originalFileName = f.getOriginalFilename();
			if(f.getSize() == 0) continue;
			File uploadFile = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\" + "\\" +originalFileName);
			System.out.println(originalFileName);
			dto.setHotelImage(dto.getHotelImage()+ originalFileName);
			i++;
			try {
				//실제로 전송
				f.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////

		String hotelAddress = addr1 + "/" + addr2 + "/" + addr3;
		
		dto.setHotelTel(dto.getHotelTel().replaceAll("-", ""));
		dto.setHotelAddress(hotelAddress);
			
//		System.out.println(dto.toString());
			
		int result = 0;
		System.out.println(result+"llll");
		result = hotelservice.insertHotel(dto);
		System.out.println(result);
		
		
		model.addAttribute("title", "전체 지점 관리");
		model.addAttribute("page", "allHotelView.jsp");
		model.addAttribute("result", result);
		
		return "es/admin_main";
	}
	
	
	@RequestMapping("/updateHotelView.do")
	public String updateHotelView(String hotelNo, Model model) {
		
		HotelDTO dto = hotelservice.selectOneHotel(hotelNo);
		
		String address[] = dto.getHotelAddress().split("/");
		
		model.addAttribute("title", "전체 지점 관리");
		model.addAttribute("page", "updateHotelView.jsp");
		model.addAttribute("dto", dto);
		model.addAttribute("address", address);
		
		return "es/admin_main";
	}
	
	@RequestMapping("/updateHotel.do")
	public String updateHotel(HotelDTO dto, String addr1, String addr2, String addr3,
			Model model, MultipartHttpServletRequest request) throws IOException {
		System.out.println("hotel update test : " + dto.getHotelNo());
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////

		File userRoot = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\");
		String encoding = "utf-8";
		
		if(!userRoot.exists())
			userRoot.mkdirs();
		
		List<MultipartFile> filelist = request.getFiles("file");
		int i = 1;
		for(MultipartFile f : filelist) {
			String originalFileName = f.getOriginalFilename();
			if(f.getSize() == 0) continue;
			File uploadFile = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\" + "\\" +originalFileName);
			System.out.println(originalFileName);
			dto.setHotelImage(dto.getHotelImage()+ originalFileName);
			i++;
			try {
				//실제로 전송
				f.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////

		String hotelAddress = addr1 + "/" + addr2 + "/" + addr3;
			
		dto.setHotelAddress(hotelAddress);
		dto.setHotelTel(dto.getHotelTel().replaceAll("-", ""));
		
		System.out.println("update test : ");
		System.out.println(dto.toString());
			
		int result = hotelservice.updateHotel(dto);
		System.out.println(result);

		return "redirect:/selectAllHotel.do";
	}
	
	@RequestMapping("/deleteHotel.do")
	public String deleteHotel(String hotelNo, Model model) {
		System.out.println(hotelNo);
		int result = hotelservice.deleteHotel(hotelNo);
		
		
		return "redirect:/selectAllHotel.do";
	}
////////////////////////////////////////////// MEMBER / QNA 부 /////////////////////////////
	@RequestMapping("/selectAllMember.do")
	public String selectAllMember(Model model) {
		List<MemberDTO> list = memberservice.selectAllMember();
		model.addAttribute("list", list);
		model.addAttribute("title", "전체 회원 관리");
		model.addAttribute("page", "memberList.jsp" );
		return "es/admin_main";
	}
	
	@RequestMapping("/memberProfile.do")
	public String memberProfile(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, String email, Model model) {
		if(email == null) 
			email = "test00";
		MemberDTO member = memberservice.selectMember(email);
		String date = member.getBirth();
		member.setBirth(date.substring(0, 10));
		
		String[] addr = member.getAddress().split("/"); 
		
		List<QnADTO> qna = qnaservice.selectQna(email, pageNo);
		int count = qnaservice.QnaCount(email);
		PaggingVO vo = new PaggingVO(count, pageNo, 5 ,5);
		
		model.addAttribute("pagging", vo);
		model.addAttribute("dto", member);
		model.addAttribute("qna", qna);
		model.addAttribute("addr", addr);
		model.addAttribute("title", "회원 프로필");
		model.addAttribute("page", "memberProfile.jsp" );
		return "es/admin_main";
	}
	
	@RequestMapping("/updateQnaResponse.do")
	public String updateQnaResponse(String qnano, String response, String email) {
		System.out.println("qna : " + qnano + ", " + "response : " + response);		
		int result = qnaservice.updateQnaResponse(qnano, response);
		
		return "redirect:/memberProfile.do?email="+email;
	}
	
	@RequestMapping("/deleteQnaResponse.do")
	public String deleteQnaResponse(String qnano, String email) {
		int result = qnaservice.deleteQnaResponse(qnano);
		
		return "redirect:/memberProfile.do?email="+email;
	}
	
	@RequestMapping("/memberUpdate.do")
	public void memberUpdate(MemberDTO dto, String addr1, String addr2, String addr3,
			HttpServletResponse response, HttpServletRequest request) 
			throws IOException {
		dto.setAddress(addr1 + "/" + addr2 + "/" + addr3);
		
		dto.setBirth(dto.getBirth().replaceAll("-", "/").substring(2, 10));
		
		System.out.println("memberupdatetest : " + dto.toString());
		
		int result = memberservice.updateMember(dto);
		response.setContentType("text/html;charset=utf-8");
		if(result == 1)
			response.getWriter().write(
					"<script>alert('수정이 완료되었습니다.');location.href='memberProfile.do?email="+dto.getEmail()+"';</script>");
		else
			response.getWriter().write(
					"<script>alert('수정에 실패하였습니다.');</script>");
	}
	
	@RequestMapping("/memberDelete.do")
	public void memberDelete(String email, HttpServletResponse response) throws IOException {
		int result = memberservice.deleteMember(email);
		response.getWriter().write(String.valueOf(result));
	}
	
	@RequestMapping("/memberSearch.do")
	public ResponseEntity<List<MemberDTO>> memberSearch(String kind, String search) {
		List<MemberDTO> list = memberservice.searchMember(kind, search);
		return ResponseEntity.ok(list);
	}
	
	@RequestMapping("/selectAllRoom.do")
	public String selectAllRoom(Model model) {
		List<RoomDTO> list = roomservice.selectAllRoom();
		
		// 정보확인
		for(int i=0;i<list.size();i++) {
			//System.out.println(list.get(i).toString());
			
			List<RoomDTO> optionlist = roomservice.selectRoomOption(list.get(i).getRoomNo());
			String hotelName = roomservice.selectHotelName(list.get(i).getHotelNo());
			System.out.println(list.get(i).getRoomDetailManual());
			list.get(i).setHotelName(hotelName);
			list.get(i).setOptionlist(optionlist);
		}
		model.addAttribute("title", "전체 객실 관리");
		model.addAttribute("page", "allRoomView.jsp" );
		model.addAttribute("list", list);
		
		return "es/admin_main";
	}
	
	@RequestMapping("/updateRoomView.do")
	public String updateRoomView(String roomNo, Model model) {
		
		RoomDTO dto = roomservice.selectOneRoom(roomNo);
		List<RoomDTO> optionlist = roomservice.selectRoomOption(roomNo);
		List<RoomDTO> hotellist = roomservice.selectHotelList();
		List<RoomDTO> insertoptionlist = roomservice.selectInsertRoomOption(roomNo);
		
		dto.setHotellist(hotellist);
		dto.setOptionlist(optionlist);
		
		model.addAttribute("title", "전체 객실 관리");
		model.addAttribute("page", "updateRoomView.jsp");
		model.addAttribute("dto", dto);
		model.addAttribute("insertoptionlist", insertoptionlist);
		
		return "es/admin_main";
	}
	
	@RequestMapping("/updateRoom.do")
	public String updateRoom(RoomDTO dto, Model model, MultipartHttpServletRequest request) throws IOException {
		System.out.println("updateroom test : " + dto.getOptionName());
		
		// Room 옵션 재설정 부
		String[] option = dto.getOptionName().split("/");
		// 옵션 리셋
		roomservice.resetRoomOption(dto.getRoomNo());
		
		for(int i=0;i<option.length;i++) {
			roomservice.insertRoomOption(dto.getRoomNo(), option[i]);
		}
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////

		File userRoot = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\");
		String encoding = "utf-8";
		
		if(!userRoot.exists())
			userRoot.mkdirs();
		
		List<MultipartFile> filelist = request.getFiles("file");
		int i = 1;
		for(MultipartFile f : filelist) {
			String originalFileName = f.getOriginalFilename();
			if(f.getSize() == 0) continue;
			File uploadFile = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\" + "\\" +originalFileName);
			System.out.println(originalFileName);
			dto.setRoomImage(dto.getRoomImage()+ originalFileName);
			i++;
			try {
				//실제로 전송
				f.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////

		roomservice.updateRoom(dto);
		roomservice.updateRoomImage(dto);

		return "redirect:/selectAllRoom.do";
	}
	
	@RequestMapping("/insertRoomView.do")
	public String insertRoomView(Model model) {
		List<RoomDTO> hotellist = roomservice.selectHotelList();
		List<RoomDTO> alloptionlist = roomservice.allOptionList();
		
		model.addAttribute("hotellist", hotellist);
		model.addAttribute("alloptionlist", alloptionlist);
		model.addAttribute("title", "객실 등록");
		model.addAttribute("page", "insertRoomView.jsp" );
		
		return "es/admin_main";
	}
	
	@RequestMapping("/insertRoom.do")
	public String insertRoom(RoomDTO dto, Model model, MultipartHttpServletRequest request
			) throws IOException{
		
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////

		File userRoot = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\");
		String encoding = "utf-8";
		
		if(!userRoot.exists())
			userRoot.mkdirs();
		
		List<MultipartFile> filelist = request.getFiles("file");
		int i = 1;
		for(MultipartFile f : filelist) {
			String originalFileName = f.getOriginalFilename();
			if(f.getSize() == 0) continue;
			File uploadFile = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\" + "\\" +originalFileName);
			System.out.println(originalFileName);
			dto.setRoomImage(dto.getRoomImage()+ originalFileName);
			i++;
			try {
				//실제로 전송
				f.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////

		int result = roomservice.insertRoom(dto);
		int result2 = roomservice.insertRoomImage(dto);
		
		String[] option = dto.getOptionName().split("/");
		
		for(int j=0;j<option.length;j++) {
			roomservice.insertRoomOption(dto.getRoomNo(), option[j]);
		}
		
		model.addAttribute("title", "전체 지점 관리");
		model.addAttribute("page", "allHotelView.jsp");
		model.addAttribute("result", result);
		
		return "es/admin_main";
	}
	
	
	@RequestMapping("/setOptionView.do")
	public String setOptionView(Model model) {
		List<RoomDTO> alloptionlist = roomservice.allOptionList();
		
		model.addAttribute("alloptionlist", alloptionlist);
		model.addAttribute("title", "옵션 관리");
		model.addAttribute("page", "setOptionView.jsp");
		
		return "es/admin_main";
	}
	
	@RequestMapping("/setOption.do")
	public String setOption(String option, String optionPath, Model model, MultipartHttpServletRequest request
			) throws IOException{
		System.out.println("asdasd"+option);
		System.out.println(optionPath);
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////
		
		File userRoot = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\");
		String encoding = "utf-8";
		
		if(!userRoot.exists())
			userRoot.mkdirs();
		
		List<MultipartFile> filelist = request.getFiles("file");
		int i = 1;
		for(MultipartFile f : filelist) {
			String originalFileName = f.getOriginalFilename();
			if(f.getSize() == 0) continue;
			File uploadFile = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\" + "\\" +originalFileName);
			System.out.println(originalFileName);
			optionPath += originalFileName;
			i++;
			try {
				//실제로 전송
				f.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////
		String optionName = option;
		int result = roomservice.setOption(optionName, optionPath);
		
		return "redirect:/setOptionView.do";
	}
	
	@RequestMapping("deleteOption.do")
	public ResponseEntity<Integer> setOptiion(String optionName) {
		
		int result = roomservice.deleteOption(optionName);
		
		return ResponseEntity.ok(result);
	}
	
	//------------------------------------------------------------------------
	
	@RequestMapping("/deleteRoom.do")
	public void deleteRoom(String roomNo, HttpServletResponse response) throws IOException {
		int result = roomservice.deleteRoom(roomNo);
		response.getWriter().write(String.valueOf(result));
	}
	
	@RequestMapping("/selectAllRestaurant.do")
	public String selectAllRestaurant(Model model) {
		List<RestaurantDTO> list = restaurantservice.selectAllRestaurant();
		
		model.addAttribute("title", "전체 식당 관리");
		model.addAttribute("page", "allRestaurantView.jsp" );
		model.addAttribute("list", list);
		
		return "es/admin_main";
	}
	
	@RequestMapping("/deleteRestaurant.do")
	public void deleteRestaurant(String restaurantNo, HttpServletResponse response) throws IOException {
		int result = restaurantservice.deleteRestaurant(restaurantNo);
		response.getWriter().write(String.valueOf(result));
	}
	
	@RequestMapping("/updateRestaurantView.do")
	public String updateRestaurantView(String restaurantNo, Model model) {
		
		RestaurantDTO dto = restaurantservice.selectOneRestaurant(restaurantNo);
		List<RoomDTO> hotellist = roomservice.selectHotelList();
		List<RestaurantDTO> typelist = restaurantservice.selectTypeList();
		
		model.addAttribute("typelist", typelist);
		model.addAttribute("hotellist", hotellist);
		model.addAttribute("title", "전체 식당 관리");
		model.addAttribute("page", "updateRestaurantView.jsp");
		model.addAttribute("dto", dto);
		
		return "es/admin_main";
	}
	
	@RequestMapping("/updateRestaurant.do")
	public String updateRestaurant(RestaurantDTO dto, Model model, MultipartHttpServletRequest request) throws IOException {
		System.out.println("updateRestaurant test : " + dto.getHotelNo());
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////

		File userRoot = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\");
		String encoding = "utf-8";
		
		if(!userRoot.exists())
			userRoot.mkdirs();
		
		List<MultipartFile> filelist = request.getFiles("file");
		int i = 1;
		for(MultipartFile f : filelist) {
			String originalFileName = f.getOriginalFilename();
			if(f.getSize() == 0) continue;
			File uploadFile = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\" + "\\" +originalFileName);
			System.out.println(originalFileName);
			dto.setRestaurantImagepath(dto.getRestaurantImagepath()+ originalFileName);
			i++;
			try {
				//실제로 전송
				f.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////
			
		String[] data = dto.getHotelNo().split(",");
		dto.setHotelNo(data[0]);
		dto.setHotelName(data[1]);
		System.out.println("update test : ");
		System.out.println(dto.toString());
			
		int result = restaurantservice.updateRestaurant(dto);
		System.out.println(result);

		return "redirect:/selectAllRestaurant.do";
	}
	
	@RequestMapping("/insertRestaurantView.do")
	public String insertRestaurantView(Model model) {
		List<RoomDTO> hotellist = roomservice.selectHotelList();
		List<RestaurantDTO> typelist = restaurantservice.selectTypeList();
		
		model.addAttribute("hotellist", hotellist);
		model.addAttribute("typelist", typelist);
		model.addAttribute("title", "식당 등록");
		model.addAttribute("page", "insertRestaurantView.jsp" );
		
		return "es/admin_main";
	}
	
	@RequestMapping("/insertRestaurant.do")
	public String insertRestaurantView(RestaurantDTO dto, Model model, MultipartHttpServletRequest request) throws IOException {
		System.out.println("updateRestaurant test : " + dto.getHotelNo());
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////

		File userRoot = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\");
		String encoding = "utf-8";
		
		if(!userRoot.exists())
			userRoot.mkdirs();
		
		List<MultipartFile> filelist = request.getFiles("file");
		int i = 1;
		for(MultipartFile f : filelist) {
			String originalFileName = f.getOriginalFilename();
			if(f.getSize() == 0) continue;
			File uploadFile = new File("C:\\Hotel\\hotel_project\\HotelProject\\src\\main\\webapp\\admin_resource\\images\\" + "\\" +originalFileName);
			System.out.println(originalFileName);
			dto.setRestaurantImagepath(dto.getRestaurantImagepath()+ originalFileName);
			i++;
			try {
				//실제로 전송
				f.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		/////////////////////////////// 파일 업로드 부 ////////////////////////////////
		String[] data = dto.getHotelNo().split(",");
		dto.setHotelNo(data[0]);
		dto.setHotelName(data[1]);
		System.out.println(dto.toString());
			
		int result = restaurantservice.insertRestaurant(dto);
		System.out.println(result);

		return "redirect:/selectAllRestaurant.do";
	}
}








