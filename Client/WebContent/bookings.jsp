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
	  sessionStorage.setItem('status','loggedIn') 
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
	<nav class="navbar navbar-expand-lg navbar-dark bg-blue fixed-top">
	<div class="container">
		<a class="navbar-brand" href="#"><img alt="BAR"
			src="img/BAR_Logo.png" height="100" width="100"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Test</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>



				<%-- 				<%

String loginButtonReference;
		String dataToggle;
if(session.getAttribute("currentSessionUser")==null){
	loginButtonReference = "#myModal";
	dataToggle = "data-toggle=\"modal\"";
} else {
	loginButtonReference = "account.jsp";
	dataToggle = "";
	
	
	
} --%>


				<%

String loginButtonAttributes;
if(session.getAttribute("currentSessionUser")==null){
	loginButtonAttributes = "class=\"nav-link\" href=\"#myModal\" data-toggle=\"modal\" style=\"color: grey;\"";
	
} else {
	loginButtonAttributes = "class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\" style=\"color: Chartreuse ;\"";
	
	
	
}

%>
				<li class="nav-item active dropdown"><a <%=loginButtonAttributes%>><i
						class="fas fa-user"></i></a><span class="sr-only">(current)</span>

					<div class="dropdown-menu">
						<a class="dropdown-item" href="account.jsp"><i class="fas fa-user-circle"></i> Profile</a> <a
							class="dropdown-item" href="bookings.jsp"><i class="fa fa-calendar-alt"></i> Bookings</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="logout.jsp"><i
						class="fas fa-sign-out-alt"></i> Sign out</a>
					</div></li>




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
						<form action="AjaxController" method="post" name='login_form'
							id="login_form" style="margin: 10px;">
							<div class="form-group">
								<input type="email" class="form-control"
									placeholder="Enter email" name="useremail" id="useremail"
									required>
							</div>
							<div class="form-group">
								<input type="password" class="form-control"
									placeholder="Password" name="userpassword" id="userpassword"
									required>
							</div>
							<input type="submit" class="btn btn-success" name="login_button"
								id="login_button" value="Login">
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

<!-- 	<header>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			Slide One - Set the background image for this slide in the line below
			<div class="carousel-item active"
				style="background-image: url('http://placehold.it/1900x1080')">
				<div class="carousel-caption d-none d-md-block">
					<h3>First Slide</h3>
					<p>This is a description for the first slide.</p>
				</div>
			</div>
			Slide Two - Set the background image for this slide in the line below
			<div class="carousel-item"
				style="background-image: url('http://placehold.it/1900x1080')">
				<div class="carousel-caption d-none d-md-block">
					<h3>Second Slide</h3>
					<p>This is a description for the second slide.</p>
				</div>
			</div>
			Slide Three - Set the background image for this slide in the line below
			<div class="carousel-item"
				style="background-image: url('http://placehold.it/1900x1080')">
				<div class="carousel-caption d-none d-md-block">
					<h3>Third Slide</h3>
					<p>This is a description for the third slide.</p>
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
	</header> -->
	<!-- Page Content -->
	<section class="py-5">
	<div class="container">


	<%for(Booking b : c.getBookings()){%>
	
		<%=b.getBookingNumber()%>
	<%}%>









	</div>
	</section>

	<%-- 	<!-- Footer -->
	<footer class="py-5 bg-dark">
	<div class="container">

		<p class="m-0 text-center text-white">Timeout in seconds:
			${pageContext.session.maxInactiveInterval}</p>


		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2018</p>
	</div>
	<!-- /.container --> </footer> --%>
	<%-- <%@ include file = "footer.jsp" %> --%>


	<jsp:include page="footer.jsp" />

	<script>

$.sessionTimeout({
    keepAliveUrl: 'keep-alive.jsp',
    logoutUrl: 'logout.jsp',
    redirUrl: 'logout.jsp',
    warnAfter: 54e4,
	redirAfter: 6e4,
    countdownMessage: 'Redirecting in {timer} seconds.',
    countdownBar: true
});
</script>


</body>

</html>
</body>
</html>