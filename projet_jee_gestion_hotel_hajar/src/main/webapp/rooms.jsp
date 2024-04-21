<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style> 

@import url('https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&subset=cyrillic,cyrillic-ext,devanagari,greek,greek-ext,latin-ext,vietnamese');

body{
	background: #1f2029;
	font-family: 'Poppins', sans-serif;
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
.ff{
  display: flex;
    align-items: right;
        justify-content: right;
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
 <br>
  <br>
   <br>
    <br>
     <br>
    
    <br>
	<div class=ff>
    <form action="SearchRoomServlet" method="GET"   class="d-flex align-items-center">
        
         <input  type="text" id="roomType" name="roomType" placeholder="Type de Chambre" required class="form-control mx-2">
         <input type="submit" value="Search" class="btn btn-primary buttoncolor">
    </form>
    </div>
    <c:if test="${not empty rooms}">
    </c:if>	
<div class="container">

    <h1>Liste des Chambres</h1>
    
    <div class="row">
        <c:forEach var="room" items="${rooms}">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body  border-yellow">
                     <img src="${room.image}" class="card-img-top" ">
                        <h5 class="card-title">Chambre ${room.roomId}</h5>
                        <p class="card-text">Type: ${room.roomType}</p>
                        <p class="card-text">Prix: ${room.price}</p>
                        <p class="card-text">Équipements: ${room.amenities}</p>
                        <p class="card-text">Disponible: ${room.available ? 'Oui' : 'Non'}</p>
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
         
          <p>&copy; 2024 our web site hotel hajar </p>
      </div>
         
    </footer> 

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>