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

<title>Book A Room</title>



<!-- Referenced CSS, JS and jQuery -->
<jsp:include page="sources.jsp" />


</head>

<body>

	<!-- Navigation -->
	<jsp:include page="navbar.jsp" />



	<header>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- Slide One - Set the background image for this slide in the line below -->
			<div class="carousel-item active"
				style="background-image: url('img/carousel/slide1.jpeg')">

				<div class="carousel-caption d-none d-md-block">
					<h2>A room at the palm of your hand</h2>

				</div>
			</div>
			<!-- Slide Two - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('img/carousel/slide2.jpeg')">
				<div class="carousel-caption d-none d-md-block">
					<h2>Rooms with all standards around Europe</h2>

				</div>
			</div>
			<!-- Slide Three - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('img/carousel/slide3.jpeg')">
				<div class="carousel-caption d-none d-md-block">
					<h2>Check your bookings now</h2>

				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	</header>

	<!-- Page Content -->
	<section class="py-5">
	<div class="container">

		<h1>Welcome to Book A Room</h1>
		<br>
		<p>This is a site where you can easily manage your account settings and bookings. 
		Just tap the top right user icon and you are good to go. For booking adjustments, 
		please contact your closest Book A Room service office.</p>


	</div>
	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />


</body>

</html>