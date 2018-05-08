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
	<section class="py-5">
	<div class="container" style="margin-top: 100px">

		<div class="card">
			<div class="card-header" style="font-size: 24px">
				<i class="fas fa-user-circle"></i> Bookings
				<button type="button" class="btn btn-info" id="toggleEditBtn"
					name="toggleEditBtn" data-toggle="collapse"
					data-target="#editBookingsCardFooter" style="float: right">Edit</button>
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
				<span class="feedback-text" name="servletFeedback"
					id="servletFeedback" style="font-weight: bold; color: #28a745;"></span>
				<div class="form-group row justify-content-end">
					<div class="col-sm-3">
						<input type="hidden" name="bookingOperation" id="bookingOperation"
							value="removeBookings">
					</div>

				</div>


			</div>
			<div id="editBookingsCardFooter" class="card-footer collapse">
				<div class="form-group row justify-content-end">
					<div class="col-sm-3">

						<input type="button" class="btn btn-success" value="Update"
							id="removeBookingSubmit" name="removeBookingSubmit"> <input
							type="button" class="btn btn-danger" value="Cancel"
							id="undoRemoveBooking" name="undoRemoveBooking"
							data-toggle="collapse" data-target="#editBookingsCardFooter">
					</div>
				</div>
			</div>
		</div>




	</div>


	<!-- Footer -->
	<jsp:include page="footer.jsp" />


	<script type="text/javascript">
		$(document).ready(function() {
			$('#removeBookingSubmit').click(function(e) {
				var userOperation = $('#bookingOperation').val();
				var selectedBookings = new Array();

				$("input[type=checkbox]:checked").each(function() {
					selectedBookings.push($(this).val());
				});

				$.ajax({
					type : 'POST',
					data : {
						operation : userOperation,
						bookings : selectedBookings,
					},
					datatype : 'json',
					url : 'AjaxController',
					success : function(data) {

						$('tbody>tr').each(function() {

							if ($.inArray($(this).attr('id'), data) !== -1) {
								this.remove();

							}
						});

						$('#servletFeedback').addClass('servlet-feedback');
						$('#servletFeedback').html("Bookings removed!");
						$('#editBookingsCardFooter').removeClass('show');

					},
					error : function(jqXHR, status, error) {
						console.log(status + ": " + error);
					}

				});
				e.preventDefault();

			});

		});

		var selectable = false;
		$('#toggleEditBtn')
				.click(
						function() {

							if (!selectable) {

								$('thead>tr')
										.prepend(
												'<th style="color:red;" id="cancelColumn">Cancel</th>');
								$('tbody>tr')
										.prepend(
												'<td><label class="checkbox-inline"><input type="checkbox" value=""></label></td>');

								$('tbody>tr').each(
										function(i) {

											$('td>label>input:nth-child(1)',
													this).attr(
													'value',
													$('td:nth-child(2)', this)
															.html());

										})
								selectable = true;
							}

						});

		$('#undoRemoveBooking').click(function() {
			selectable = false;
			$('thead>tr').find('th:first').remove();
			$('tbody>tr').find('td:first').remove();
		})
	</script>


</body>

</html>
</body>
</html>