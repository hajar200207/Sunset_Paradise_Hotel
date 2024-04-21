package Servlets;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.RoomDAO;
import MySQL.MySQLRoomDAO;
import  model.Room;



public class RoomSearchServlet extends HttpServlet {
    private RoomDAO roomDAO;

    @Override
    public void init() throws ServletException {
        // Initialize your RoomDAO implementation (e.g., MySQLRoomDAO)
        try {
			roomDAO = new MySQLRoomDAO();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get search parameters from request
        Date startDate = parseDate(request.getParameter("start_date"));
        Date endDate = parseDate(request.getParameter("end_date"));
        // Other search parameters like room type, etc.

        // Perform search for available rooms
        List<Room> availableRooms = roomDAO.getAvailableRooms(startDate, endDate);

        // Forward results to JSP or JSON response
        // request.setAttribute("availableRooms", availableRooms);
        // request.getRequestDispatcher("search_results.jsp").forward(request, response);

        // For simplicity, let's just send a simple response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(roomsToJson(availableRooms));
    }

    private Date parseDate(String dateString) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            return dateFormat.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
    private String roomsToJson(List<Room> rooms) {
        // Implement JSON conversion logic
        return null;
    }
}
