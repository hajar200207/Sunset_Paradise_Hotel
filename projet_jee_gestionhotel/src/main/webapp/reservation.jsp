<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Make Reservation</title>
</head>
<body>
    <h1>Make Reservation</h1>
    <form action="reservation" method="post">
        User ID: <input type="text" name="user_id"><br>
        Room ID: <input type="text" name="room_id"><br>
        Start Date: <input type="text" name="start_date"><br>
        End Date: <input type="text" name="end_date"><br>
        <input type="submit" value="Make Reservation">
    </form>
</body>
</html>
