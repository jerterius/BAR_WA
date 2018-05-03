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
		sessionStorage.setItem('status', 'loggedIn');

	});
</script>


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


						<tr id="<%=b.getBookingNumber()%>">

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
						id="editBookingsSubmit" name="editBookingsSubmit"> <input
						type="button" class="btn btn-danger" value="Cancel"
						id="undoEditBookings" name="undoEditBookings"
						data-toggle="collapse" data-target="#editBookings">
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
		$('#toggleEditBtn')
				.click(
						function() {

							if (!selectable) {

								$('thead>tr').prepend(
										'<th style="color:red;" id="cancelColumn">Cancel</th>');
								$('tbody>tr')
										.prepend(
												'<td><label class="checkbox-inline"><input type="checkbox" value=""></label></td>');

								$('tbody>tr').each(
										function(i) {

											$('td:nth-child(1)', this).attr(
													'id',
													$('td:nth-child(2)', this)
															.html());

										})
								selectable = true;
							}

						});

		$('#undoEditBookings').click(function() {
			selectable = false;
			$('thead>tr').find('th:first').remove();
			$('tbody>tr').find('td:first').remove();
		})
	</script>


</body>

</html>
</body>
</html>