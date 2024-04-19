package MySQL;

import java.sql.Connection;
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

	            Room room = new Room(roomId, roomType, price, amenities, available);
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
	                    resultSet.getBoolean("available")
	            );
	            rooms.add(room);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return rooms;
	}



}
