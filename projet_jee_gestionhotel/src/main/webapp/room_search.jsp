<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Inclure Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Liste des Chambres</h1>
    
    <div class="row">
        <c:forEach var="room" items="${rooms}">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <!-- Ajouter une balise img pour afficher une photo -->
                    <img src="chemin_vers_votre_image" class="card-img-top" alt="Photo de la chambre">
                    <div class="card-body">
                        <h5 class="card-title">Chambre ${room.roomId}</h5>
                        <p class="card-text">Type: ${room.roomType}</p>
                        <p class="card-text">Prix: ${room.price}</p>
                        <p class="card-text">�quipements: ${room.amenities}</p>
                        <p class="card-text">Disponible: ${room.available ? 'Oui' : 'Non'}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Inclure Bootstrap JS (facultatif si vous n'utilisez pas les fonctionnalit�s JavaScript de Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
