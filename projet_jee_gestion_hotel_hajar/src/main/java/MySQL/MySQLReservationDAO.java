package MySQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import DAO.ReservationDAO;
import model.Reservation;
public  class MySQLReservationDAO implements ReservationDAO {
    @Override
    public List<Reservation> getReservations() {
     List<Reservation> reservations = new ArrayList<>();
     String sql = "SELECT * FROM reservations";
     try (Connection connection = MySQLConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(sql);
	         ResultSet resultSet = statement.executeQuery()) {
    	 while (resultSet.next()) {
    		    int reservation_id = resultSet.getInt("reservation_id");
    		    
    		    int room_id = resultSet.getInt("room_id");
    		    Date start_date =  resultSet.getDate("start_date");
    		    Date end_date =  resultSet.getDate("end_date");
    		    String user_id = resultSet.getString("user_id");
    		    Reservation reservation = new Reservation(reservation_id,room_id,start_date,end_date,user_id);
	           reservations.add(reservation);
    	       }
     } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return reservations;
     }

    public void createReservation(Reservation reservation) {
        String sql = "INSERT INTO Reservations ( room_id, start_date, end_date,user_id) VALUES (?, ?, ?, ?)";
        try (Connection connection = MySQLConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setInt(1, reservation.getRoomId());
            statement.setDate(2, new java.sql.Date(reservation.getStartDate().getTime()));
            statement.setDate(3, new java.sql.Date(reservation.getEndDate().getTime()));
            statement.setString(4, reservation.getUserId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

	@Override
	public void cancelReservation(int reservationId) {
        String sql = "DELETE FROM Reservations WHERE reservation_id = ?";
        try (Connection connection = MySQLConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
               
            statement.setInt(1, reservationId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}