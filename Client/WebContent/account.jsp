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
<%
	Customer c = (Customer) session.getAttribute("currentSessionUser");
%>

<title><%=c.getName()%>'s Account</title>

<!-- Referenced CSS, JS and jQuery -->
<jsp:include page="sources.jsp" />


<style>
.feedback-icon {
	padding-right: 40px;
}

.form-control:invalid {
	border-color: red;
	opacity: 1;
	box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, .25)
}

.form-control:valid {
	border-color: green;
	opacity: 1;
	border-color: #28a745;
	box-shadow: 0 0 0 .2rem rgba(40, 167, 69, .25)
}

.form-control:invalid ~.invalid-feedback {
	display: block;
	width: 100%;
	text-align: right;
	font-size: 80%;
	color: #dc3545;
}

.form-control:valid ~.valid-feedback {
	display: block;
	width: 100%;
	text-align: right;
	font-size: 80%;
	color: #28a745;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

.servlet-feedback {
	display: block;
	text-align: right;
	padding-right: 85px;
	color: #28a745;
	position: absolute;
	font-weight: bold;
	transition: 1s;
}
</style>

</head>


<body>



	<!-- Navigation -->

	<jsp:include page="navbar.jsp" />


	<!-- Page Content -->
	<section class="py-5" style="margin-top: 100px">


	<div class="container">



		<form class="form-horizontal" name="accountForm" id="accountForm">
			<div class="card">
				<div class="card-header" style="font-size: 24px">
					<i class="fas fa-user-circle"></i> Profile
					<button type="button" class="btn btn-info" id="toggleEditBtn"
						name="toggleEditBtn" data-toggle="collapse"
						data-target="#editUserCardFooter" style="float: right">Edit</button>
				</div>
				<div class="card-body">

					<p class="card-text">
					<fieldset id="profileFieldset" name="profileFieldset" disabled>
						<div class="form-group row">

							<label for="titleInput" class="col-sm-2 control-label"
								style="font-weight: bold">Title</label>
							<div class="col-sm-4">
								<select id="titleInput" name="titleInput" class="form-control">
									<option selected><%=c.getTitle()%></option>
									<option>Mrs.</option>
									<option>Ms.</option>
									<option>Dr.</option>

								</select>


							</div>

						</div>
						<div class="form-group row">

							<label for="nameInput" class="col-sm-2 control-label"
								style="font-weight: bold">Name</label>
							<div class="col-sm-10">
								<input type="text" id="nameInput" class="form-control"
									placeholder="Enter name" value="<%=c.getName()%>" required
									pattern=".{4,}">

								<div class="valid-feedback feedback-icon">
									<i class="fa fa-check"></i>
								</div>
								<div class="invalid-feedback feedback-icon">
									<i class="fa fa-times"></i>
								</div>
								<div class="invalid-feedback feedback-text">Name must be
									at least 4 characters</div>

							</div>

						</div>

						<div class="form-group row">

							<label for="addressInput" class="col-sm-2 control-label"
								style="font-weight: bold">Address</label>

							<div class="col-sm-10">

								<input type="text" id="addressInput" class="form-control"
									value="<%=c.getAddress()%>" pattern=".{8,}">
								<div class="valid-feedback feedback-icon">
									<i class="fa fa-check"></i>
								</div>
								<div class="invalid-feedback feedback-icon">
									<i class="fa fa-times"></i>
								</div>
								<div class="invalid-feedback feedback-text">Address must
									be at least 8 characters!</div>

							</div>



						</div>


						<div class="form-group row">
							<label for="phoneNoInput" class="col-sm-2 control-label"
								style="font-weight: bold">Telephone No.</label>
							<div class="col-sm-10">
								<input type="number" id="phoneNoInput" class="form-control"
									value="<%=c.getPhoneNbr()%>" required min="010000000">
								<div class="valid-feedback feedback-icon">
									<i class="fa fa-check"></i>
								</div>
								<div class="invalid-feedback feedback-icon">
									<i class="fa fa-times"></i>
								</div>
								<div class="invalid-feedback feedback-text">Telephone
									number must contain at least 8 digits</div>
							</div>


						</div>


						<div class="form-group row">
							<label for="emailInput" class="col-sm-2 control-label"
								style="font-weight: bold">Email</label>
							<div class="col-sm-10">
								<input type="email" id="emailInput" class="form-control"
									value="<%=c.getEmail()%>" required>
								<div class="valid-feedback feedback-icon">
									<i class="fa fa-check"></i>
								</div>
								<div class="invalid-feedback feedback-icon">
									<i class="fa fa-times"></i>
								</div>
								<div class="invalid-feedback feedback-text">Email must be
									writtern e.g something@domain.com</div>
							</div>


						</div>

						<div class="form-group row">
							<label for="passwordInput" class="col-sm-2 control-label"
								style="font-weight: bold">Password</label>
							<div class="col-sm-10">
								<input type="password" id="passwordInput" class="form-control"
									placeholder="Enter a password" value="*********" required
									pattern=".{8,}">
								<div class="valid-feedback feedback-icon">
									<i class="fa fa-check"></i>
								</div>
								<div class="invalid-feedback feedback-icon">
									<i class="fa fa-times"></i>
								</div>
								<div class="invalid-feedback feedback-text">Password must
									contain 8 characters.</div>
							</div>

						</div>
						<span class="feedback-text" name="servletFeedback"
							id="servletFeedback" style="font-weight: bold; color: #28a745;"></span>
						<div class="form-group row">
							<div class="col-sm-10">
								<input type="hidden" name="userAccountOperation"
									id="userAccountOperation" value="updateUser">

							</div>
						</div>
					</fieldset>


				</div>

				<div id="editUserCardFooter" class="card-footer collapse">

					<div class="form-group row justify-content-end">
						<div class="col-sm-3">
							<input type="button" class="btn btn-success" value="Update"
								id="editUserSubmit" name="editUserSubmit"> <input
								type="reset" class="btn btn-danger" value="Cancel"
								id="undoEditUser" name="undoEditUser" data-toggle="collapse"
								data-target="#editUserCardFooter">
						</div>



					</div>
				</div>
			</div>
		</form>
	</div>
	<br>

	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />



	<script type="text/javascript">
		$(document).ready(function() {
			$('#editUserSubmit').click(function(e) {
				if ($('#accountForm')[0].checkValidity()) {
					var title = $('#titleInput').val();
					var name = $('#nameInput').val();
					var address = $('#addressInput').val();
					var phoneNo = $('#phoneNoInput').val();
					var email = $('#emailInput').val();
					var password = $('#passwordInput').val();
					var operation = $('#userAccountOperation').val();

					$.ajax({
						type : 'POST',
						data : {
							operation : operation,
							titleInput : title,
							nameInput : name,
							addressInput : address,
							phoneNoInput : phoneNo,
							emailInput : email,
							passwordInput : password,
						},
						url : 'AjaxController',
						success : function(result) {
							$('#servletFeedback').addClass('servlet-feedback');
							$('#servletFeedback').html(result);
							$('#editUserCardFooter').removeClass('show');
							$("#profileFieldset").attr("disabled", true);

						},
						error : function(jqXHR, status, error) {
							console.log(status + ": " + error);
						}

					});

					e.preventDefault();
				} else {
					console.log("Invalid form");
				}
			});

		});

		var toggleDisabled = true;
		$("#toggleEditBtn, #undoEditUser").click(function() {
			if (toggleDisabled) {
				$("#profileFieldset").attr("disabled", false);
				$("#passwordInput").attr('value', "");
				toggleDisabled = false;
			} else {
				$("#profileFieldset").attr("disabled", true);
				toggleDisabled = true;
			}

		});
	</script>


</body>

</html>
</body>
</html>