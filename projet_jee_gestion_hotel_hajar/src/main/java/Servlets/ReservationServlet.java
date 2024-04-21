package Servlets;

import java.io.IOException;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.ReservationDAO;
import MySQL.MySQLReservationDAO;
import model.Reservation;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;
    public  ReservationServlet() {
        super();
        reservationDAO = new MySQLReservationDAO();
    }
   

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
        List<Reservation> reservations = reservationDAO.getReservations();

        request.setAttribute("reservations", reservations);
     

        request.getRequestDispatcher("user_reservations.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
