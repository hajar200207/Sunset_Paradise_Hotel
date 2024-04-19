package model;

import java.util.Date;

public class Reservation {
    private int reservation_id;
    private int room_id;
    private Date start_date;
    private Date end_date;
    private String user_id;

    // Constructor, getters, and setters
    public Reservation(int reservation_id, int room_id, Date start_date, Date end_date, String user_id) {
        this.reservation_id = reservation_id;
        this.room_id = room_id;
        this.start_date = start_date;
        this.end_date = end_date;
        this.user_id = user_id;
    }

    public Reservation( int room_id, Date start_date, Date end_date, String user_id) {
    	this.room_id = room_id;
        this.start_date = start_date;
        this.end_date = end_date;
        this.user_id = user_id;
	}

	// Getters and setters
    public int getId() {
        return reservation_id;
    }

    public void setId(int reservation_id) {
        this.reservation_id = reservation_id;
    }

    public String getUserId() {
        return user_id;
    }

    public void setUserId(String user_id) {
        this.user_id = user_id;
    }

    public int getRoomId() {
        return room_id;
    }

    public void setRoomId(int room_id) {
        this.room_id = room_id;
    }

    public Date getStartDate() {
        return start_date;
    }

    public void setStartDate(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEndDate() {
        return end_date;
    }

    public void setEndDate(Date end_date) {
        this.end_date = end_date;
    }
}
