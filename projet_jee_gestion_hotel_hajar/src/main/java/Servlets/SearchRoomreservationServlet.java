package Servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.RoomDAO;
import MySQL.MySQLRoomDAO;
import model.Room;


@WebServlet("/SearchRoomreservationServlet")
public class SearchRoomreservationServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;
	    private RoomDAO roomDAO;

	    public void init() {
	        roomDAO = new MySQLRoomDAO();
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	 String startDateString = request.getParameter("startDate");
	         String endDateString = request.getParameter("endDate");

	       
	         if (startDateString == null || endDateString == null || startDateString.isEmpty() || endDateString.isEmpty()) {
	          
	             response.sendRedirect(request.getContextPath() + "/error.jsp");
	             return;
	         }

	         try {
	       
	             SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	             java.util.Date parsedStartDate = dateFormat.parse(startDateString);
	             java.util.Date parsedEndDate = dateFormat.parse(endDateString);

	            
	             java.sql.Date startDate = new java.sql.Date(parsedStartDate.getTime());
	             java.sql.Date endDate = new java.sql.Date(parsedEndDate.getTime());

	             List<Room> availableRooms = roomDAO.searchRooms(startDate, endDate);

	          
	             request.setAttribute("availableRooms", availableRooms);

	            
	             request.getRequestDispatcher("search_results.jsp").forward(request, response);
	         } catch (ParseException e) {
	             e.printStackTrace();
	         }
	    }
	    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
