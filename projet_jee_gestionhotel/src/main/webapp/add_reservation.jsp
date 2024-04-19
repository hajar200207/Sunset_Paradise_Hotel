<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Reservation</title>
</head>
<body>
    <h1>Add Reservation</h1>
    <form action="AddReservationServlet" method="post">
        User ID: <input type="text" name="userId"><br>
        Room ID: <input type="text" name="roomId"><br>
        Start Date: <input type="date" name="startDate"><br>
        End Date: <input type="date" name="endDate"><br>
        <input type="submit" value="Add Reservation">
    </form>
</body>
</html>

