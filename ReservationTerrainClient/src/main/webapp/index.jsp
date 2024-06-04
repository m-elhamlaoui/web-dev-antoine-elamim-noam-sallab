<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- Redirect user to login in page if it is not connected -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Redirect User if it is already connected -->
<c:set var="uname" value="${sessionScope.uname}" />
<c:if test="${uname!=null}">
    <c:redirect url="index1.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>R�servation Sportive INPT</title>

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
  </head>

  <body>
  <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    <nav class="navbar fixed-top navbar-expand-lg">
      <div class="container">
        <a href="index.jsp" class="navbar-brand fs-2">
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
              <a class="nav-link" href="#section_1">Accueil</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="#section_2">&Agrave; propos</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="#section_3">R�servation</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="#section_4">Contact</a>
            </li>
          </ul>

          <div class="ms-auto d-none d-lg-block">
          	<a href="registration.jsp" class="ms-3 custom-btn-inscrire btn btn-lg">
            	<i class="fa-solid fa-user-plus me-2"></i>
              S'inscrire
            </a>
            <a href="login.jsp" class="ms-3 custom-btn custom-bg-dark btn btn-lg ">
            	<i class="fa-solid fa-right-from-bracket me-2"></i>
              Se Connecter
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
                  Facilitez vos matchs avec notre syst�me de r�servation en
                  ligne des terrains de l'INPT
                </h1>
              </div>
            </div>
          </div>
        </div>

        <div class="overlay"></div>
      </section>
      <!-- END showcase -->

      <!-- START Apropos -->
      <section class="about section-padding" id="section_2">
        <div class="container">
          <div class="row">
            <div class="col-lg-6 col-12">
              <h2 class="mb-5">&Agrave; propos</h2>
            </div>

        

            <div class="col-12">
              <div class="tab-content" id="nav-tabContent">
                <div
                  class="tab-pane fade show active"
                  id="nav-intro"
                  role="tabpanel"
                  aria-labelledby="nav-intro-tab"
                >
                  <div class="row">
                    <div class="col-lg-6 col-12 mb-lg-0 mb-4">
                      <img
                        src="images/Basket_apropos.jpg"
                        class="img-fluid"
                        alt=""
                        style="width: 100%; height: 90vh"
                      />
                    </div>

                    <div class="col-lg-5 col-12 m-auto">
                      <h3 class="mb-3">R�server le Terrain de Votre Choix</h3>

                      <p>
                        Bienvenue sur notre plateforme de r�servation en ligne
                        pour les terrains de sport de l'INPT. Nous offrons aux
                        �tudiants la possibilit� de r�server facilement et
                        rapidement des cr�neaux horaires pour les terrains de
                        volley, foot et basket.
                      </p>

                      <p>
                        Notre objectif est de promouvoir l'activit� physique et
                        le bien-�tre au sein de notre communaut� universitaire
                        en simplifiant l'acc�s aux installations sportives de
                        premier ordre.
                      </p>

                      <p>
                        Que vous souhaitiez organiser un match amical, une
				        session d'entra�nement ou simplement profiter d'un
				        moment sportif entre amis, notre syst�me de r�servation
				        en ligne vous permet de planifier vos activit�s en toute
				        tranquillit�.
                      </p>
                      <p class="text-primary font-weight-bold lead text-center">
                        Rejoignez-nous pour une exp�rience sportive
                        exceptionnelle à l'INPT !
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- END Apropos -->

      <!-- START Reservation -->
      <section class="services section-padding" id="section_3">
        <div class="container">
          <div class="row">
            <h2 class="mb-5 text-center">
              R�server Votre Terrain de Sport Pr�f�r�
            </h2>

            <div class="col-lg-4 col-12 d-flex bg-primary p-0">
              <img
                src="images/services/basketball.jpg"
                class="img-fluid services-image"
                alt=""
                style="width: 100%; height: 100%; object-fit: cover"
              />
            </div>

            <div class="col-lg-4 col-12 p-0">
              <div class="services-info custom-icon-left paddingText">
                <h4 class="">Football</h4>

                <p class="mb-4">
                  R�servez votre cr�neau pour jouer en tranquillit�
                </p>

                <a class="custom-btn custom-bg-dark btn" href="football">R�server</a>
              </div>
            </div>

            <div class="col-lg-4 col-12 d-flex bg-warning p-0">
              <img
                src="images/services/volleyball.jpg"
                class="img-fluid services-image"
                alt=""
                style="width: 100%; height: 100%; object-fit: cover"
              />
            </div>

            <div class="col-lg-4 col-12 p-0 order-lg-0 order-sm-5">
              <div
                class="services-info custom-icon-right paddingText order-lg-0 order-sm-2"
              >
                <h4 class="">Basketball</h4>

                <p class="mb-4">
                  R�servez votre cr�neau pour jouer en tranquillit�
                </p>

                <a class="custom-btn custom-bg-dark btn" href="basketball">R�server</a>
              </div>
            </div>

            <div
              class="col-lg-4 col-12 d-flex bg-success p-0 order-lg-0 order-sm-4"
            >
              <img
                src="images/services/football.jpg"
                class="img-fluid services-image"
                alt=""
                style="width: 100%; height: 100%; object-fit: cover"
              />
            </div>

            <div class="col-lg-4 col-12 p-0">
              <div class="services-info custom-icon-top paddingText">
                <h4 class="">Volleyball</h4>

                <p class="mb-4">
                  R�servez votre cr�neau pour jouer en tranquillit�
                </p>

                <a class="custom-btn custom-bg-dark btn" href="volleyball">R�server</a>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- END Reservation -->

      <!-- START Contact -->
      <section class="section-padding" id="section_4">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 col-md-10 col-12 mx-auto">
              <h2 class="mb-4 text-center">Vos Suggestions Nous Int�ressent</h2>

              <form class="custom-form" role="form" action="suggestion" method="post">
                <div class="row">
                  <div class="col-lg-4 col-md-6 col-12 my-2">
                    <label class="mb-2" for="name">Nom Complet</label>

                    <input
                      type="text"
                      name="name"
                      id="name"
                      class="form-control"
                      required=""
                    />
                  </div>

                  <div class="col-lg-4 col-md-6 col-12 my-2">
                    <label class="mb-2" for="email">Address Email</label>

                    <input
                      type="email"
                      name="email"
                      id="email"
                      pattern="[^ @]*@[^ @]*"
                      class="form-control"
                      required=""
                    />
                  </div>

                  <div class="col-lg-4 col-md-6 col-12 my-2">
                    <label class="mb-2" for="subject">Niveau</label>

                    <select
                      class="form-select form-control"
                      name="subject"
                      id="subject"
                    >
                      <option selected="">Choisir Votre Niveau</option>
                      <option value="INE1">INE1</option>
                      <option value="INE2">INE2</option>
                      <option value="INE3">INE3</option>
                    </select>
                  </div>

                  <div class="col-12 my-2">
                    <label class="mb-2" for="message">Suggestions</label>

                    <textarea
                      class="form-control"
                      rows="5"
                      id="message"
                      name="message"
                    ></textarea>

                    <button type="submit" class="form-control mt-4" id="submit">
                      Envoyer
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
      <!-- END contact -->
    </main>

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
                <p class="text-white">Mobile: +212-70-500-0400</p>
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
                <a href="#section_2" class="footer-menu-link">r�servations</a>
              </li>

              <li class="footer-menu-item">
                <a href="#section_3" class="footer-menu-link"> &Agrave; Propos </a>
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
        /* Sweet Alert */
        var status = document.getElementById("status").value;
        if(status == "success") {
        	swal({
        	    title: "Merci pour votre suggestion !",
        	    text: "Nous appr�cions votre contribution et nous prendrons en compte vos suggestions pour am�liorer nos services.",
        	    icon: "success",
        	    button: "Merci "
        	});
	}
    </script>
  </body>
</html>
