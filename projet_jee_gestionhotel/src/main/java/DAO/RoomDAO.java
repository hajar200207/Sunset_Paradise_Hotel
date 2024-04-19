package DAO;

import java.util.List;

import model.Room;

public interface RoomDAO {
	
	 List<Room> showRoom();
	List<Room> searchRoom(String searchTerm);
}