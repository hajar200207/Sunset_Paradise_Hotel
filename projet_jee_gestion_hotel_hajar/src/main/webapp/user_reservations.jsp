<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    @import url('https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&subset=cyrillic,cyrillic-ext,devanagari,greek,greek-ext,latin-ext,vietnamese');

body{
	background: #1f2029;
	font-family: 'Poppins', sans-serif;
}
label{
color: white;
}
h1{
color:white;
  display: flex;
    align-items: center;
        justify-content: center;
}
      .footer{
   
    width: 100%;
    background-color: black;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: rgb(238, 234, 234);
    height: 200px;
}  
.reservation-card {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            background-color: #f8f9fa;
        }
        .card-body {
            padding: 20px;
        }

   .border-yellow {
    border: 5px solid gold;
    border-radius: 5px;
}
.buttoncolor{
 background-color: gold;
 border: 5px solid gold;
}
    </style>
    <title>Your Reservations</title>
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
   <div class="logo">
			<img src="logo1.png" alt="Company Logo" width="100px">
		
		</div>
    <a class="navbar-brand" href="index.html">Hotel Management</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="RoomServlet">chambres</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ReservationServlet"> Reservations</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="add_reservation.jsp">Ajouter Reservation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="search_results.jsp">Search chambre reservation</a>
            </li>
        </ul>
    </div>
</nav>
 <br> <br>
  <br>
   <br>
<div class="container mt-5">
    <h1>Your Reservations</h1>
    <div class="row">
        <c:forEach var="reservation" items="${reservations}">
            <div class="col-md-4">
                <div class="card reservation-card">
                    <div class="card-body border-yellow">
                        <h5 class="card-title">Reservation ID: ${reservation.id}</h5>
                        <p class="card-text">User ID: ${reservation.userId}</p>
                        <p class="card-text">Room ID: ${reservation.roomId}</p>
                        <p class="card-text">Start Date: ${reservation.startDate}</p>
                        <p class="card-text">End Date: ${reservation.endDate}</p>
                        <a href="CancelReservationServlet?reservationId=${reservation.id}" class="btn btn-danger buttoncolor">Cancel</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- End page content -->
</div> 
       <footer class="footer">
        <img src="logo1.png"" width="100px" >
          <div class="social-icons">
              <a href="#"><i class="fab fa-linkedin"></i></a>
              <a href="#"><i class="fab fa-twitter"></i></a>
              <a href="#"><i class="fab fa-instagram"></i></a>
              <a href="#"><i class="fab fa-facebook-f"></i></a>
          </div>
         
          <p>&copy; 2024 our web site weather app hajar ouadi </p>
      </div>
         
    </footer> 
<!-- Bootstrap JS and jQuery (optional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-SGxsmfePdN7DlFK3RS4r1PirMHJC3+al8cZXrMUB2oWrB3R5jMv1kKK4Jb0Ppi6h" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shCzFVn4AqvFjV+6g2woM0uPPtk+b9E7xS3tF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
