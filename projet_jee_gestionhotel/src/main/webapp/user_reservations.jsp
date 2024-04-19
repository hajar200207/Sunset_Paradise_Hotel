<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Your Reservations</title>
</head>
<body>
    <h1>Your Reservations</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Room ID</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>action</th>
        </tr>
        <c:forEach var="reservation" items="${reservations}">
            <tr>
                <td>${reservation.id}</td>
                <td>${reservation.userId}</td>
                <td>${reservation.roomId}</td>
                <td>${reservation.startDate}</td>
                <td>${reservation.endDate}</td>
                <td><a href="CancelReservationServlet?reservationId=${reservation.id}">Cancel</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
