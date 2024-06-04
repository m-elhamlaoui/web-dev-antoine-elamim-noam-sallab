<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- Redirect user to login in page if it is not connected -->
<c:set var="uname" value="${sessionScope.uname}" />
<c:if test="${uname==null}">
    <c:redirect url="login.jsp" />
</c:if>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="description"
      content="Réservation des terrains de sport à l'INPT"
    />
    <meta name="author" content="INPT" />
    <title>Mes Réservations</title>
    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,300;0,400;0,600;1,300&display=swap"
      rel="stylesheet"
    />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-icons.css" rel="stylesheet" />
    <link href="css/magnific-popup.css" rel="stylesheet" />
    <link href="css/reservation.css" rel="stylesheet" />
    <script
      src="https://kit.fontawesome.com/c2a0177bf5.js"
      crossorigin="anonymous"
    ></script>
    <style>
      .card {
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
        transition: background-color 0.3s;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }

      .card h5 {
        margin-bottom: 10px;
      }

      .reserved-card {
        background-color: #e8f5e9; /* Vert clair */
        border-left: 5px solid #388e3c; /* Bordure vert foncé */
      }
      }
      .btn-continue {
        background-color: var(--primary-color);
        color: var(--white-color);
        font-weight: var(--font-weight-bold);
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, box-shadow 0.3s, transform 0.3s;
    	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }
      .btn-continue:hover {
        background-color: var(--dark-color);
	    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
	    transform: translateY(-2px);
      }
      
      .btn-continue:disabled {
	    background-color: #cccccc; /* Couleur de fond pour le bouton désactivé */
	    color: #666666; /* Couleur du texte pour le bouton désactivé */
	    cursor: not-allowed; /* Curseur pour indiquer que le bouton est désactivé */
	    border: 1px solid #999999; /* Bordure pour le bouton désactivé */
	    box-shadow: none;
	    transform: none;
	    opacity: 0.6; /* Légère transparence pour indiquer l'état désactivé */
		}
      
      .controls {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
}

	.controls form {
	    display: flex;
	    align-items: center;
	}
	
	.controls button {
	    background-color: #38b083; /* Couleur de fond des boutons */
	    color: #ffffff; /* Couleur du texte des boutons */
	    border: none;
	    border-radius: 5px;
	    padding: 10px 20px;
	    margin: 0 10px; /* Espace entre les boutons */
	    cursor: pointer;
	    font-size: 16px;
	    transition: background-color 0.3s;
	}
	
	.controls button:hover {
	    background-color: #2d8e6f; /* Couleur de fond des boutons au survol */
	}
	
	.controls button:disabled {
    background-color: #cccccc; /* Couleur de fond des boutons désactivés */
    color: #666666; /* Couleur du texte des boutons désactivés */
    cursor: not-allowed; /* Changer le curseur pour montrer que le bouton est désactivé */
	}
	
	.controls #currentDate {
	    font-size: 18px;
	    font-weight: bold;
	    color: #565758;
	}
	
	.controls input[type="hidden"] {
	    display: none;
	}
	
	.btn-cancel {
        background: #ff6b6b; /* Rouge clair pour le bouton annuler */
        color: #fff;
        font-weight: var(--font-weight-bold);
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
      }

      .btn-cancel:hover {
        background: #ff4c4c; /* Rouge plus foncé pour le hover */
      }
      
    </style>
  </head>
  <body>
  <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    <nav class="navbar fixed-top navbar-expand-lg">
        <div class="container">
          <a href="index1.jsp" class="navbar-brand fs-2">
            <i class="fa-solid fa-medal"></i>INPTPlay
          </a>
  
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
  
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-lg-5">
              <li class="nav-item">
                <a class="nav-link" href="./index1.jsp">Accueil</a>
              </li>
              
              <li class="nav-item">
                <a class="nav-link" href="#section_2">Réservation</a>
              </li>
  
              <li class="nav-item">
                <a class="nav-link" href="index1.jsp#section_2">&Agrave; propos</a>
              </li>
  
              <li class="nav-item">
                <a class="nav-link" href="index1.jsp#section_4">Contact</a>
              </li>
            </ul>
  
            <div class="ms-auto d-none d-lg-block">
              <span class="me-3 custom-btn btn-lg bg-success">
                <i class="fa-solid fa-user me-2"></i>
                <c:out value="${sessionScope.uname}"></c:out>
              </span>
            <a href="logout" class="ms-3 custom-btn-deconnecter btn btn-lg ">
              Se Déconnecter
              <i class="fa-solid fa-right-from-bracket ms-2"></i>
            </a>
            </div>
          </div>
        </div>
      </nav>
  

        <!-- START showcase -->
        <section
          class="hero d-flex justify-content-center align-items-center"
          id="section_1"
        >
          <div class="container">
            <div class="row">
              <div class="col-lg-8 col-12">
                <div class="heroText">
                  <h1 class="text-white mb-lg-5 mb-4">
                    Mes Terrains Réservés
                  </h1>
                </div>
              </div>
            </div>
          </div>
  
          <div class="overlay"></div>
        </section>
        <!-- END showcase -->


              <!-- START Reserved Terrains -->
      <section class="reserved section-padding" id="section_2">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <h2 class="mb-5 text-center">Vos Terrains Réservés</h2>
            </div>

            <c:forEach var="reservation" items="${reservations}">
	            <div class="col-lg-4 col-md-6 col-12">
	              <div class="card reserved-card">
	                <div class="card-body">
	                  <h5 class="card-title">Terrain de <c:out value="${reservation.sport}"/></h5>
	                  <p class="card-text">Date: <c:out value="${reservation.date}"/></p>
	                  <p class="card-text">Heure: <c:out value="${reservation.houre}"/></p>
	                </div>
	                <div class="card-footer text-end">
	                  <form action="mesReservations" method="post">
	                  	<input type="hidden" name="name" value="${sessionScope.uname }" />
	                  	<input type="hidden" name="date" value="${reservation.date}" />
	                  	<input type="hidden" name="houre" value="${reservation.houre}" />
	                    <input type="hidden" name="sport" value="${reservation.sport}" />
	                    <button type="submit" class="btn-cancel">
	                      Annuler la Réservation
	                    </button>
	                  </form>
	                </div>
	              </div>
	            </div>
	         </c:forEach>

          </div>
        </div>
      </section>
      <!-- END Reserved Terrains -->
    <!-- START Footer -->
    <footer class="site-footer">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-12 mx-auto my-lg-0 my-4">
              <h5 class="text-white mb-3">Contactez-nous</h5>
  
              <ul class="footer-menu">
                <li class="footer-menu-item">
                  <a
                    href="mailto:souhailsallab12@gmail.com"
                    class="footer-menu-link"
                    >souhailsallab12@gmail.com</a
                  >
                </li>
  
                <li class="footer-menu-item">
                  <p class="text-white">Téléphone : +212-70-500-0400</p>
                </li>
              </ul>
            </div>
  
            <div class="col-lg-2 col-12 mx-auto my-lg-0 my-4">
              <h5 class="text-white mb-3">Liens Utiles</h5>
  
              <ul class="footer-menu">
                <li class="footer-menu-item">
                  <a href="#section_1" class="footer-menu-link">Accueil</a>
                </li>
  
                <li class="footer-menu-item">
                  <a href="#section_2" class="footer-menu-link">Réservations</a>
                </li>
  
                <li class="footer-menu-item">
                  <a href="index1.jsp#section_2" class="footer-menu-link">À propos</a>
                </li>
  
                <li class="footer-menu-item">
                  <a href="#section_4" class="footer-menu-link">Contact</a>
                </li>
              </ul>
            </div>
  
            <div class="col-lg-2 col-12 mx-auto my-lg-0 my-4">
              <h5 class="text-white mb-3">Adresse</h5>
  
              <p class="text-white mb-1">
                INPT, Avenue Allal El Fassi, Madinat Al Irfane, Rabat, Maroc
              </p>
  
              <p></p>
            </div>
  
            <div class="site-footer-bottom mt-5">
              <div class="row pt-4">
                <div class="col-lg-6 col-12">
                  <p class="copyright-text tooplate-link">
                    Changed with
                    <i class="fa-regular fa-heart"></i>
                    by NASE <br />Design: Tooplate
                  </p>
                </div>
  
                <div class="col-lg-3 col-12 ms-auto">
                  <ul class="social-icon">
                    <li><a href="#" class="social-icon-link bi-facebook"></a></li>
  
                    <li>
                      <a href="#" class="social-icon-link bi-twitter"></a>
                    </li>
  
                    <li>
                      <a href="#" class="social-icon-link bi-instagram"></a>
                    </li>
  
                    <li><a href="#" class="social-icon-link bi-linkedin"></a></li>
  
                    <li><a href="#" class="social-icon-link bi-youtube"></a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </footer>

    <!-- JAVASCRIPT FILES -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.backstretch.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/magnific-popup-options.js"></script>
    <script src="js/click-scroll.js"></script>
    <script src="js/custom.js"></script>
    
    <!-- Sweet Alert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <!-- JS SCRIPTE FOR THIS PAGE -->
    <script>  
	    /* Accéder à la Section réservation */
	    window.onload = function() {
	        if (window.location.hash === '') {
	            window.location.hash = '#section_2';
	        }
	    };
	    
        /* Sweet Alert */
        var status = document.getElementById("status").value;
        if(status == "success") {
        	swal({
        	    title: "Réservation Annulée",
        	    text: "Votre réservation a été annulée avec succès. Vous pouvez réserver un autre créneau si vous le souhaitez.",
        	    icon: "success",
        	    button: "OK"
        	});
	}
    </script>
  </body>
</html>

