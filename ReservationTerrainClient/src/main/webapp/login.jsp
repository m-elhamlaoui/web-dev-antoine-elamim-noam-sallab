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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Se Connecter</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">

<!-- Sweet Alert css -->
<link rel="stylesheet" href="alert/dist/sweetalert.css">

</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/login.jpg" alt="sing up image">
						</figure>
						<a href="registration.jsp" class="signup-image-link">Créer un Compte</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Se Connecter</h2>
						<form method="post" action="login" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="userename"
									placeholder="Votre Nom" required="required" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Mot de Passe" required="required" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Se souvenir de moi</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						<div class="social-login">
							<span class="social-label">Se connecter avec</span>
							<ul class="socials">
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "failed") {
		    swal("Désolé", "Nom d'utilisateur ou mot de passe incorrect", "error");
		}
		if(status == "InvalidUname") {
		    swal("Désolé", "Veuillez entrer un nom d'utilisateur", "error");
		}
		if(status == "InvalidUpwd") {
		    swal("Désolé", "Veuillez entrer un mot de passe", "error");
		}
		if(status == "Impossible de communiquer avec la base de données") {
		    swal("Désolé", "Problème de base de données", "error");
		}
		if(status == "success") {
		    swal("Félicitations", "Compte créé avec succès", "success");
		}

		
	</script>
</body>
</html>