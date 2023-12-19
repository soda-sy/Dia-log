package controller.diary;

import java.io.PrintWriter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

import controller.Controller;
import controller.DispatcherServlet;
import model.dto.review.ReviewDiary;
import model.dto.visit.Visit;
import model.service.review.ReviewManager;
import model.service.visit.VisitManager;

public class DiaryController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		  int userId = Integer.parseInt(request.getParameter("userId"));

	      HttpSession session = request.getSession();
	      int userId = (int) session.getAttribute("userId");
	      
	      logger.info("SS"+  userId);
	      //friend에서 넘어온 친구 아이디
	      String ownerId = request.getParameter("ownerId");

		ReviewManager manager = ReviewManager.getInstance();
		VisitManager visitMan = VisitManager.getInstance();
		
		if(ownerId != null) {
			int ownerIdInt = Integer.parseInt(ownerId);
			// 방문자 수 넣기
			Visit visit = new Visit();
		    visit.setVisitorId(userId);	        
		        //바꿔야함
		    visit.setOwnerId(ownerIdInt);
		    visitMan.createVisitor(visit);
			
		}
		List<ReviewDiary> reviewDiaryList = manager.getUserDiary(userId);
		
//	        // Set the start field as a formatted string
		for (ReviewDiary review : reviewDiaryList) {
			review.setStart(review.getFormattedStart());
		}
		
////	   // List를 JSON 형태로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonResult = objectMapper.writeValueAsString(reviewDiaryList);
////
		request.setAttribute("jsonResult", jsonResult);	        
		request.setAttribute("ownerId", ownerId);
		
		return "/diary/CalendarPage.jsp";

	}
}