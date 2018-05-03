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




<script type="text/javascript">

$(window).load(function() {
	  sessionStorage.setItem('status','loggedIn') 
	});
	
$(document).ready(function(){
$('#editUserSubmit').click(function(){
	var name = $('#nameInput').val();
	var address = $('#addressInput').val();
	var phoneNo = $('#phoneNoInput').val();
	var email = $('#emailInput').val();
	var password = $('#userpassword').val();
	
	$.ajax({
		type: 'POST',
		data: {
			operation: "updateCustomer",
			nameInput: name,
			addressInput: address,
			phoneNoInput: phoneNo,
			email: email,
			password: password,
			},
		url: 'AjaxController',
		success: function(result){
		 $("#result1").html(result);
		 
		},
	   	error: function(jqXHR, status, error) {
	   		console.log(status + ": " + error);
       	}
	
	
	});
	
	//e.preventDefault();
	
});

}); 


</script>


</head>


<body>



	<!-- Navigation -->

	<jsp:include page="navbar.jsp" />


	<!-- Page Content -->
	<section class="py-5" style="margin-top: 100px">


	<div class="container">




		<div class="card">
			<div class="card-header" style="font-size: 24px">
				<i class="fas fa-user-circle"></i> Profile
				<button type="button" class="btn btn-info" id="toggleEditBtn"
					name="toggleEditBtn" data-toggle="collapse" data-target="#editUser"
					style="float: right">Edit</button>
			</div>
			<div class="card-body">

				<p class="card-text">
				<form class="form-horizontal">


					<fieldset id="profileFieldset" name="profileFieldset" disabled>
						<div class="form-group row">

							<label for="nameInput" class="col-sm-2 control-label"
								style="font-weight: bold">Name</label>
							<div class="col-sm-10">
								<input type="text" id="nameInput" class="form-control"
									value="<%=c.getName()%>">

							</div>

						</div>

						<div class="form-group row">
							<label for="addressInput" class="col-sm-2 control-label"
								style="font-weight: bold">Address</label>
							<div class="col-sm-10">
								<input type="text" id="addressInput" class="form-control"
									value="<%=c.getAddress()%>">
							</div>


						</div>


						<div class="form-group row">
							<label for="phoneNoInput" class="col-sm-2 control-label"
								style="font-weight: bold">Telephone No.</label>
							<div class="col-sm-10">
								<input type="text" id="phoneNoInput" class="form-control"
									value="<%=c.getPhoneNbr()%>">
							</div>


						</div>


						<div class="form-group row">
							<label for="emailInput" class="col-sm-2 control-label"
								style="font-weight: bold">Email</label>
							<div class="col-sm-10">
								<input type="text" id="emailInput" class="form-control"
									value="<%=c.getEmail()%>">
							</div>


						</div>

						<div class="form-group row">
							<label for="passwordInput" class="col-sm-2 control-label"
								style="font-weight: bold">Password</label>
							<div class="col-sm-10">
								<input type="password" id="passwordInput" class="form-control"
									placeholder="**************">
							</div>


						</div>

					</fieldset>

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
    keepAliveUrl: 'keep-alive.jsp',
    logoutUrl: 'logout.jsp',
    redirUrl: 'logout.jsp',
    warnAfter: 10000, /* 54e4 */
	redirAfter: 600000, /* 6e4 */
    countdownMessage: 'Redirecting in {timer} seconds.',
    countdownBar: true
});

var toggleDisabled = true;
$("#toggleEditBtn, #undoEditUser").click(function(){
	if(toggleDisabled){
	$("#profileFieldset").attr("disabled", false);
	toggleDisabled = false;
	} else {
		$("#profileFieldset").attr("disabled", true);
		toggleDisabled = true;
	}

	
});

$('input').bind('input',function(){
	var inputValue = $(this).val();
	
	
	if(inputValue.length > 5){
	/* 	$(this).html('<div class=\"valid-feedback feedback-icon\"><i class=\"fa fa-check\"></i></div>'); */
		$(this).addClass('is-valid');
	$(this).add
	$(this).parent().append('<div class=\"valid-feedback feedback-icon\"><i class=\"fa fa-check\"></i></div><div class=\"invalid-feedback feedback-icon\"><i class=\"fa fa-times\"></i></div>');

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

</script>


</body>

</html>
</body>
</html>