<%@page import="group25.ejb.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%
	Customer c = (Customer) session.getAttribute("currentSessionUser");
%>


<style>
.feedback-text {
	position: relative;
	top: 0rem;
}

.inputWithIcon{
position:relative;}

.inputWithIcon input[type=email], .inputWithIcon input[type=password]{
	padding-left: 40px;
	
}
.inputWithIcon i:not(.fa-times):not(.fa-check){
	position: absolute !important;
	left: 1px;
	top: 1.5px;
	padding: 9.7px 9px;
	background-color: #e4e8ec;
	border-radius: 3px 0 0 3px;
	color: #fff;
	transition: 3s;
	
}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-blue fixed-top">
	<div class="container">
		<a class="navbar-brand" href="#"><img alt="BAR"
			src="img/BAR_Logo.png" height="100" width="100"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbarResponsive">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
				<li class="nav-item"><a class="nav-link" href="test.jsp">Test</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>



				<%
					String loginButtonAttributes;
					String loginLabel;
					String loggedInUser;
					if (c == null) {
						loginButtonAttributes = "class=\"nav-link\" href=\"#myModal\" data-toggle=\"modal\"";
						loginLabel = " Login";
						loggedInUser = "";

					} else {
						loginButtonAttributes = "class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\" style=\"color: Chartreuse ;\"";
						loginLabel = "";
						loggedInUser = c.getName();

					}
				%>
				<li class="nav-item dropdown"><a <%=loginButtonAttributes%>><i
						class="fas fa-user"></i><%=loginLabel%></a><span class="sr-only">(current)</span>

					<div class="dropdown-menu">
						<a class="dropdown-item" href="account.jsp"><i
							class="fas fa-user-circle"></i> Profile</a> <a class="dropdown-item"
							href="bookings.jsp"><i class="fa fa-calendar-alt"></i>
							Bookings</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="logout.jsp"><i
							class="fas fa-sign-out-alt"></i> Sign out</a>
					</div></li>

				<li class="nav-item nav-link" style="color: Chartreuse; size: 24px"><%=loggedInUser%></li>

			</ul>


		</div>
	</div>
	</nav>

	<div id="myModal" class="modal fade text-center">
		<div class="modal-dialog">
			<div class="col-lg-8 col-sm-8 col-12 main-section">
				<div class="modal-content">
					<div class="col-lg-12 col-sm-12 col-12 login_close">
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="col-lg-12 col-sm-12 col-12 user-img">
						<i class="fas fa-user fa-5x fa-cog"></i>
					</div>
					<div class="col-lg-12 col-sm-12 col-12 user-name">
						<h1>User Login</h1>

					</div>
					<div class="col-lg-12 col-sm-12 col-12 form-input">
						<form name='login_form' id="login_form" method="post"
							style="margin: 10px;">
							<div class="form-group">
								<div class="inputWithIcon">
									<input type="email" class="form-control"
										placeholder="Enter email" name="userEmail" id="userEmail"
										required> <i class="fas fa-at"></i>
											<div class="valid-feedback feedback-icon">
									<i class="fa fa-check"></i>
								</div>
								<div class="invalid-feedback feedback-icon">
									<i class="fa fa-times"></i>
								</div>
								<div class="invalid-feedback feedback-text" id="emailFeedback">User does not
									exist!</div>
								</div>
							

							</div>
							<div class="form-group">
							<div class="inputWithIcon">
								<input type="password" class="form-control"
									placeholder="Password" name="userPassword" id="userPassword"
									required>
									<i class="fas fa-key"></i>
									<div class="valid-feedback feedback-icon">
									<i class="fa fa-check""></i>
								</div>
								<div class="invalid-feedback feedback-icon">
									<i class="fa fa-times"></i>
								</div>
								<div class="invalid-feedback feedback-text" id="passwordFeedback">Password
									incorrect!</div>
								</div>
								
							</div>
							<input type="hidden" name="userOperation" id="userOperation"
								value="login"> <input type="button"
								class="btn btn-success" name="login_button" id="login_button"
								value="Login">
						</form>
					</div>
					<div class="col-lg-12 col-sm-12 col-12 link-part">
						<a href="http://www.nicesnippets.com" target="_blank">Forgot
							Password?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	
	$(document).ready(function() {
		$('#login_button').click(function(e) {
			var userOperation = $('#userOperation').val();
			var userEmail = $('#userEmail').val();
			var userPassword = $('#userPassword').val();

			if($('#login_form')[0].checkValidity()){
			
			$.ajax({
				type : 'POST',
				data : {
					operation : userOperation,
					email : userEmail,
					password : userPassword
				},
				url : 'AjaxController',
				success : function(data) {

					switch (data) {
					case "Password incorrect":
						$("#userPassword").addClass('is-invalid');

						break;
					case "Invalid user":
						$("#userEmail").addClass('is-invalid');

						break;

					default:
						window.location.href = "account.jsp";
					}

				},
				error : function(jqXHR, status, error) {
					console.log(status + ": " + error);
				}

			});
			e.preventDefault();
			
		}else{
			
		console.log("Invalid form");
		}
		});

	});

	

	function validateEmail(sEmail) {
		var filter = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if (filter.test(sEmail)) {
		return true;
		}
		else {
		return false;
		}
		};
	


		
		$('#userEmail')
				.bind(
						'input',
						function() {
							var userEmail = $('#userEmail').val();

							if (validateEmail(userEmail)) {
								$('#userEmail').removeClass('is-invalid');
								$('#userEmail').addClass('is-valid');

							} else {
								$('#userEmail').removeClass('is-valid');
								$('#userEmail').addClass('is-invalid');
								$('#emailFeedback')
										.html(
												'Not a valid email address. Example: tester@testmail.com');

							}

						});
		$('#userPassword').bind(
				'input',
				function() {
					var userPassword = $('#userPassword').val();
					if (userPassword.length > 3) {
						$('#userPassword').removeClass('is-invalid');
						$('#userPassword').addClass('is-valid');

					} else {
						$('#userPassword').removeClass('is-valid');
						$('#userPassword').addClass('is-invalid');
						$('#passwordFeedback').html(
								'You must enter a password (min 4 letters)');

					}

				});
		
		$.sessionTimeout({
		    keepAliveUrl: 'keep-alive.jsp',
		    logoutUrl: 'logout.jsp',
		    redirUrl: 'logout.jsp',
		    warnAfter: 54e4,
			redirAfter: 6e5,
		    countdownMessage: 'Redirecting in {timer} seconds.',
		    countdownBar: true
		});
		
		
	</script>

</body>
</html>