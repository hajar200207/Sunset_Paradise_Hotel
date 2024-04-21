package MySQL;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import DAO.RoomDAO;
import model.Room;

public class MySQLRoomDAO implements RoomDAO {

	@Override
	public List<Room> showRoom() {
	    List<Room> rooms = new ArrayList<>();
	    String sql = "SELECT * FROM rooms";

	    try (Connection connection = MySQLConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(sql);
	         ResultSet resultSet = statement.executeQuery()) {

	        while (resultSet.next()) {
	            int roomId = resultSet.getInt("room_id");
	            String roomType = resultSet.getString("room_type");
	            double price = resultSet.getDouble("price");
	            String amenities = resultSet.getString("amenities");
	            boolean available = resultSet.getBoolean("available");
	            String image = resultSet.getString("image");

	            Room room = new Room(roomId, roomType, price, amenities, available,image);
	            rooms.add(room);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return rooms;
	}


	@Override
	public List<Room> searchRoom(String searchTerm) {
	    List<Room> rooms = new ArrayList<>();
	    String sql = "SELECT * FROM rooms WHERE room_type LIKE ?";
	    try {
	        Connection connection = MySQLConnection.getConnection();
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, "%" + searchTerm + "%");

	        // Execute the query
	        ResultSet resultSet = statement.executeQuery();

	        // Process the result set and populate the list of searched rooms
	        while (resultSet.next()) {
	            Room room = new Room(
	                    resultSet.getInt("room_id"),
	                    resultSet.getString("room_type"),
	                    resultSet.getDouble("price"),
	                    resultSet.getString("amenities"),
	                    resultSet.getBoolean("available"),
	                    resultSet.getString("image")
	                    
	            );
	            rooms.add(room);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return rooms;
	}


	@Override
	 public List<Room> searchRooms(Date startDate, Date endDate) {
        List<Room> availableRooms = new ArrayList<>();
        String sql = "SELECT * FROM rooms WHERE room_id IN (SELECT room_id FROM reservations WHERE start_date <= ? AND end_date >= ?)";
        try (Connection connection = MySQLConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDate(1, new java.sql.Date(endDate.getTime()));
            statement.setDate(2, new java.sql.Date(startDate.getTime()));
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int roomId = resultSet.getInt("room_id");
                    String roomType = resultSet.getString("room_type");
                    double price = resultSet.getDouble("price");
                    String amenities = resultSet.getString("amenities");
                    boolean available = resultSet.getBoolean("available");
                    String image = resultSet.getString("image");
                    Room room = new Room(roomId, roomType, price, amenities, available, image);
                    availableRooms.add(room);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return availableRooms;
    }

}
