<%@page import="group25.ejb.Booking"%>
<%@page import="group25.ejb.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Test</title>

<!-- Referenced CSS, JS and jQuery -->
<jsp:include page="sources.jsp" />



</head>


<body>



	<!-- Navigation -->

	<jsp:include page="navbar.jsp" />


	<!-- Page Content -->
	<section class="py-5" style="margin-top: 100px">


	<div class="container">




		<div class="card">
			<div class="card-header" style="font-size: 24px">
				<i class="fas fa-user-circle"></i> Test
			</div>
			<div class="card-body">

				<p class="card-text">
				<p>
					Type in your TestCase or TestSuite<br>
				</p>
				<form action="TestServlet" method="get" name="youTypeItForm">
					<input type="text" name="suite" size=60 value="" /> <input
						type="submit" value="Run" />
				</form>

				<hr>
				<p>
					Select one of the following TestCases<br>
				</p>
				<form action="TestServlet" method="get" name="youPickItForm">
					<select name="suite" size="2" multiple>
						<option value="ics.junit.ejb.CustomerBeanTest">
							ics.junit.ejb.CustomerBeanTest</option>
						<option value="ics.junit…">ett.annat.TestCase</option>
					</select> <input type="submit" value="Run" />
				</form>
			</div>

			<div id="editUser" class="card-footer collapse">

				<div class="form-group row justify-content-end">
					<div class="col-sm-3">
						<input type="button" class="btn btn-success" value="Update"
							id="editUserSubmit" name="editUserSubmit"> <input
							type="button" class="btn btn-danger" value="Cancel"
							id="undoEditUser" name="undoEditUser" data-toggle="collapse"
							data-target="#editUser">
					</div>


				</div>
			</div>
		</div>
	</div>
	<br>


	<!-- 
	<div id="editUser" class="collapse">
		<div class="container">
		<div class="card ">
		
			<div class="card-body">

				<p class="card-text">
	
	Lorem ipsum dolor sit amet,
		consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
		labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
		exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.



	</div>
	
				</div>
		</div>
	</div> --> </section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	<script>
		$.sessionTimeout({
			keepAliveUrl : 'keep-alive.jsp',
			logoutUrl : 'logout.jsp',
			redirUrl : 'logout.jsp',
			warnAfter : 54e4,
			redirAfter : 6e5,
			countdownMessage : 'Redirecting in {timer} seconds.',
			countdownBar : true
		});

		var toggleDisabled = true;
		$("#toggleEditBtn, #undoEditUser").click(function() {
			if (toggleDisabled) {
				$("#profileFieldset").attr("disabled", false);
				toggleDisabled = false;
			} else {
				$("#profileFieldset").attr("disabled", true);
				toggleDisabled = true;
			}

		});

		(function() {
			'use strict';
			window.addEventListener('load', function() {
				var form = document.getElementById('needs-validation');
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			}, false);
		})();

		/* Fungerande validering men måste konfigureras */

		var validation = true;
		$('#nameInput, #addressInput').bind('input', function() {
			var inputValue = $(this).val();

			if (inputValue.length > 5 && validation) {
				$(this).removeClass('is-invalid');
				$(this).addClass('is-valid');
				validation = false;
			} else {
				$(this).removeClass('is-valid');
				$(this).addClass('is-invalid');

			}
		});
	</script>


</body>

</html>
</body>
</html>