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
<title>Créer un Compte</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">


<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<!-- Sweet Alert css -->
<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Créer un Compte</h2>
					
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Nom" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Email"  />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Mot de passe"/>
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Répétez votre mot de passe" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Mobile" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									J'accepte toutes les déclarations dans les <a href="#" class="term-service">
									Conditions d'utilisation</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="S'inscrire" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">Je suis déjà membre</a>
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
		if(status == "success") {
		    swal("Félicitations", "Compte créé avec succès", "success");
		}
		if(status == "failed") {
		    swal("Échec de la création du compte", "Réessayez plus tard", "error");
		}
		if(status == "InvalidUname") {
		    swal("Veuillez entrer votre nom", "Le nom d'utilisateur est vide", "error");
		}
		if(status == "InvalidUemail") {
		    swal("Veuillez entrer votre email", "L'email est vide", "error");
		}
		if(status == "InvalidUpwd") {
		    swal("Veuillez entrer votre mot de passe", "Le champ mot de passe est vide", "error");
		}
		if(status == "WeakUpwd") {
		    swal("Mot de passe faible", "Le mot de passe doit comporter au moins 8 caractères", "error");
		}
		if(status == "InvalidUmobile") {
		    swal("Veuillez entrer votre contact", "Le numéro de contact est vide", "error");
		}
		if(status == "InvalidMobileLength") {
		    swal("Numéro de téléphone invalide", "Veuillez entrer un numéro de téléphone valide", "error");
		}
		if(status == "InvalideConfirmePwd") {
		    swal("Les mots de passe ne correspondent pas", "Veuillez les saisir à nouveau", "error");
		}
		if (status == "email_duplicate") {
		    swal("Email déjà existant", "Veuillez saisir un email différent", "error");
		}
		
	</script>
	
	



</body>
</html>