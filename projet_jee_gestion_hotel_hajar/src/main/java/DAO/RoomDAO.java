package DAO;

import java.sql.Date;
import java.util.List;

import model.Room;

public interface RoomDAO {
	
	 List<Room> showRoom();
	List<Room> searchRoom(String searchTerm);
	List<Room> searchRooms(Date startDate, Date endDate);
}