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

<script type="text/javascript" src="vendor/jquery/jquery.js"></script>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>

<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Session Timeout Warning-->
<!-- <script src="js/jquery.userTimeout.min.js"></script>
 -->
<script src="js/bootstrap-session-timeout.min.js"></script>



<script type="text/javascript">
	$(window).load(function() {
		sessionStorage.setItem('status', 'loggedIn');

	});
</script>

<!-- Custom styles for this template -->
<link href="css/half-slider.css" rel="stylesheet">
<link href="css/modal-login.css" rel="stylesheet">

<!-- Custom font -->
<link href="fonts/web-fonts-with-css/css/fontawesome-all.css"
	rel="stylesheet">
</head>


<body>



	<!-- Navigation -->
	<jsp:include page="navbar.jsp" />


	<!-- Page Content -->
	<section class="py-5">
	<div class="container" style="margin-top: 100px">

		<div class="card">
			<div class="card-header" style="font-size: 24px">
				<i class="fas fa-user-circle"></i> Bookings
				<button type="button" class="btn btn-info" id="toggleEditBtn"
					name="toggleEditBtn" data-toggle="collapse"
					data-target="#editBookings" style="float: right">Edit</button>
			</div>
			<div class="card-body">

				<table class="table table-hover">
					<thead>
						<tr>
							<th>Booking No.</th>
							<th>Address</th>
							<th>Room No.</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Booking b : c.getBookings()) {
						%>


						<tr>
							<td><%=b.getBookingNumber()%></td>
							<td><%=b.getAdress()%></td>
							<td><%=b.getRoomNumber()%></td>
							<td><%=b.getDate()%></td>
						</tr>

						<%
							}
						%>

					</tbody>
				</table>
			</div>

		</div>
		<div id="editBookings" class="card-footer collapse">

			<div class="form-group row justify-content-end">
				<div class="col-sm-3">
					<input type="button" class="btn btn-success" value="Update"
						id="editUserSubmit" name="editUserSubmit"> <input
						type="button" class="btn btn-danger" value="Cancel"
						id="undoEditUser" name="undoEditUser" data-toggle="collapse"
						data-target="#editBookings">
				</div>

			</div>
		</div>




	</div>
	</section>

	<jsp:include page="footer.jsp" />

	<script>
		$.sessionTimeout({
			keepAliveUrl : 'keep-alive.jsp',
			logoutUrl : 'logout.jsp',
			redirUrl : 'logout.jsp',
			warnAfter : 54e4,
			redirAfter : 6e4,
			countdownMessage : 'Redirecting in {timer} seconds.',
			countdownBar : true
		});

		var selectable = false;
		$('#toggleEditBtn').click(function() {
			if (!selectable) {
				$('thead>tr').append('<th style="color:red;">Cancel</th>');
				$('tbody>tr').append('<td><label class="checkbox-inline"><input type="checkbox" value=""></label></td>');
				selectable = false;
			}

		});
	</script>


</body>

</html>
</body>
</html>