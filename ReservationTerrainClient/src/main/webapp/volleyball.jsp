<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- Redirect user to login in page if it is not connected -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>Réserver un Terrain de Volley</title>
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
        cursor: pointer;
      }
      .card.available {
        background-color: #e0ffe0;
      }
      .card.reserved {
        background-color: #ffe0e0;
      }
      
      .card.selected {
    background-color: #e0f7ff; /* Bleu clair pour sélectionné */
    border: 2px solid #007bff; /* Bordure bleue pour carte sélectionnée */
    box-shadow: 0 0 10px rgba(0, 123, 255, 0.5); /* Ombre pour carte sélectionnée */
	}
      .card h5 {
        margin-bottom: 10px;
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
                <a class="nav-link" href="index1.jsp">Accueil</a>
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
  
      <main>
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
                    Réservez Votre Terrain de Volleyball en Un Clic !
                  </h1>
                </div>
              </div>
            </div>
          </div>
  
          <div class="overlay"></div>
        </section>
        <!-- END showcase -->


        <!-- START Reservation -->
    <main>
    
      <section class="section-padding" id="section_2">
      <div class="col-12 text-center mb-5">
              <h2 class="text-center mb-5">Réservez Votre Créneau Horaire</h2>
            </div>
      <!-- Controler les jours -->
      <div class="pb-5 controls">
        <form id="date-form" action="volleyball" method="get">
            <button type="button" id="previousDay">Jour précédent</button>
            <span id="currentDate"></span>
            <button type="button" id="nextDay">Jour Suivant</button>
            <input type="hidden" id="selectedDate" name="selectedDate" value="${selectedDate != null ? selectedDate : ''}"/>
        </form>
    </div>
    <!-- Controler les heures -->
        <div id="heure-container" class="container">
          <div class="row">
            
           <c:forEach var="hour" begin="9" end="20">
                        <c:set var="startTime" value="${String.format('%02d:%02d', hour, 00)}" />
                        <c:set var="endTime" value="${String.format('%02d:%02d', hour + 1, 00)}" />
                        <c:set var="displayText" value="${startTime} - ${endTime}" />
                        <c:set var="classAttr" value="available" />
                        <c:forEach var="reservation" items="${tousReservationJour}">
                            <c:if test="${reservation.houre eq displayText}">
                                <c:set var="classAttr" value="reserved" />
                            </c:if>
                        </c:forEach>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="card ${classAttr}">
                                <h5>${displayText}</h5>
                                <p>${classAttr}</p>
                            </div>
                        </div>
            </c:forEach>

            <div class="col-12 text-center mt-5">
              <form id="reservation-form" action="volleyball" method="post">
		        <input type="hidden" id="heure-selectionnee" name="houre" value="">
		        <input type="hidden" id="date-selectionnee" name="date" value="${selectedDate != null ? selectedDate : ''}">
		        <input type="hidden" name="userName" value="${sessionScope.uname}">
		        <input class="btn-continue" type="submit" value="Réserver" disabled>
		      </form>
            </div>
          </div>
        </div>
      </section>
    </main>
    <!-- END Reservation -->

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
        // JavaScript pour rendre les cartes interactives
        var cards = document.querySelectorAll('.card');
        cards.forEach(card => {
            card.addEventListener('click', function() {
                if (!card.classList.contains('reserved')) {
                    cards.forEach(c => c.classList.remove('selected'));
                    card.classList.add('selected');
                    document.getElementById('heure-selectionnee').value = card.querySelector('h5').innerText;
                    document.getElementById('date-selectionnee').value = document.getElementById('selectedDate').value;
                    document.getElementById('reservation-form').querySelector('input[type="submit"]').disabled = false;
                }
            });
        });
        
        // Rendre la date interactive
        const currentDateElement = document.getElementById('currentDate');
        let currentDate = new Date('${selectedDate != null ? selectedDate : ''}');
        if (!currentDate || isNaN(currentDate)) {
            currentDate = new Date();
        }
        
        function formatDate(date){
            const options = {
                weekday: 'long',
                day: 'numeric',
                month: 'long',
                year: 'numeric'
            };
            return new Intl.DateTimeFormat('fr-FR', options).format(date);
        }

     // Disable previous Button
        function checkDisablePreviousButton() {
        const today = new Date();
        const previousButton = document.getElementById('previousDay');
        if (currentDate.getTime() <= today.getTime()) {
            previousButton.disabled = true;
            previousButton.classList.add('disabled');
        } else {
            previousButton.disabled = false;
            previousButton.classList.remove('disabled');
        }
    }

    	currentDateElement.textContent = formatDate(currentDate);
    	checkDisablePreviousButton();
        
        function updateDate(increment) {
            currentDate.setDate(currentDate.getDate() + increment);
            document.getElementById('selectedDate').value = currentDate.toISOString().split('T')[0];
            document.getElementById('date-form').submit();
        }
        
        document.getElementById('nextDay').addEventListener('click', function() {
            updateDate(1);
        });
        
        document.getElementById('previousDay').addEventListener('click', function() {
            updateDate(-1);
        });
        
        // Initialisation de la date actuelle à la première visite
        if (!document.getElementById('selectedDate').value) {
            document.getElementById('selectedDate').value = currentDate.toISOString().split('T')[0];
            document.getElementById('date-form').submit();
        }
        
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
        title: "Félicitations!",
        text: "Votre réservation a été effectuée avec succès.\nPréparez-vous à profiter de votre activité!",
        icon: "success",
        button: "Super!"
    });
}
        /* Remove Past date */
        const checkingDate = '${selectedDate}';    
        const year = checkingDate.split("-")[0];
        const month = parseInt(checkingDate.split("-")[1]) - 1;
        const day = checkingDate.split("-")[2];
        
        cards.forEach(card => {
        	const hour =  card.querySelector('h5').innerText.split("-")[0].split(":")[0];
        	const givenDate = new Date(year, month, day, hour);
        	const nowDate = new Date();
        	if (givenDate.getTime() < nowDate.getTime()){
        		card.parentElement.remove();
        	}
        });
    </script>
  </body>
</html>

