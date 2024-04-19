package DAO;
import model.Reservation;
import java.util.List;

public interface ReservationDAO {
    List<Reservation> getReservations();
    void createReservation(Reservation reservation);
    void cancelReservation(int reservationId);
}
