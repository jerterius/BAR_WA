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

<script type="text/javascript" src="vendor/jquery/jquery.js"></script>
<script type="text/javascript">

/* $(document).ready(function(){
	$('#login_button').click(function(){
		var email = $('#useremail').val();
		var password = $('#userpassword').val();
		
		$.ajax({
			type: 'POST',
			data: {operation: "findCustomer",
				email: email,
				password: password},
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
	
}); */


//SPACE FOR SCRIPTS

</script>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>

<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

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
	<%-- <nav class="navbar navbar-expand-lg navbar-dark bg-blue fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#"><img alt="BAR"
				src="img/BAR_Logo.png" height="100" width="100"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Test</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>

				<%
Customer c = (Customer)session.getAttribute("currentSessionUser");
String loginButtonAttributes;
String loginLabel;
String loggedInUser;
if(c==null){
	loginButtonAttributes = "class=\"nav-link\" href=\"#myModal\" data-toggle=\"modal\"";
	loginLabel = " Login";
	loggedInUser = "";
	
} else {
	loginButtonAttributes = "class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\" style=\"color: Chartreuse ;\"";
	loginLabel = "";
	loggedInUser = c.getName();
	
	
}

%>
				<li class="nav-item dropdown"><a
					<%=loginButtonAttributes%>><i class="fas fa-user"></i><%=loginLabel%></a><span
					class="sr-only">(current)</span>

					<div class="dropdown-menu">
						<a class="dropdown-item" href="account.jsp"><i
							class="fas fa-user-circle"></i> Profile</a> <a class="dropdown-item"
							href="bookings.jsp"><i class="fa fa-calendar-alt"></i>
							Bookings</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="logout.jsp"><i
							class="fas fa-sign-out-alt"></i> Sign out</a>
					</div></li>
					
					<li class="nav-item nav-link" style="color:Chartreuse; size:24px"><%=loggedInUser %></li>
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
          <form action="AjaxController" method="post" name='login_form' id="login_form" style="margin: 10px;">
            <div class="form-group">
              <input type="email" class="form-control" placeholder="Enter email" name="useremail" id="useremail" required>
            </div>
            <div class="form-group">
              <input type="password" class="form-control" placeholder="Password" name="userpassword" id="userpassword" required>
            </div>
            <input type="submit" class="btn btn-success" name="login_button" id="login_button" value="Login">
          </form>
        </div>
        <div class="col-lg-12 col-sm-12 col-12 link-part">
            <a href="http://www.nicesnippets.com" target="_blank">Forgot Password?</a>
        </div>
      </div>
    </div>
  </div>
</div>  --%>


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
					style="background-image: url('http://placehold.it/1900x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3>First Slide</h3>
						<p>This is a description for the first slide.</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('http://placehold.it/1900x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Second Slide</h3>
						<p>This is a description for the second slide.</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
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
	</header>

	<!-- Page Content -->
	<section class="py-5">
		<div class="container">
		<form>
		<span id="test"></span>
		
		
		
		</form>
			<h1>Half Slider by Start Bootstrap</h1>
			<p>
			Lorem ipsum dolor sit amet, eam suas populo invenire at, eu tritani civibus qui. Homero moderatius duo ut. Ea has dolorem placerat constituam. Decore liberavisse te sit, ad pro noster animal persius, qui at tantas suscipit salutandi. Nonumy mentitum convenire eam in.

Eu quando legere gloriatur pro, ea laudem labitur saperet nec. Quando nonumy doctus ne sed, ad vim reque nonumes elaboraret. Noster fuisset fierent at mea, usu ad omittam corrumpit. Ex sea partem fabellas.

Vel lucilius maiestatis ea, ex vim integre bonorum concludaturque, agam altera omittam mel at. Mea no elitr dolore laudem. Luptatum definitionem eos ut, vel esse similique in. Dicant splendide duo cu, nostrud deseruisse appellantur ad nam, has te oratio utamur. Legendos aliquando cu pro. Ius et doming explicari pertinacia.

An labore aeterno his, has ad diam vero. Vitae numquam te mei, falli malorum est an. Est soleat libris bonorum et, magna dicat reprimique per ea. Nam ipsum melius laboramus ut, pro ut doctus scriptorem, ei tation antiopam consectetuer eum. Eu vix nullam option referrentur.

Vix ex pertinax mediocritatem, quidam meliore ex vix. Est dicunt bonorum hendrerit eu, vis te iisque alienum gloriatur. Vitae comprehensam ne his, at eos sale dicunt suavitate. Porro dissentiet cum ut. Mei ne ludus nostro, nibh meliore eu vix. An possim abhorreant has, electram repudiandae delicatissimi quo in, sea solum quando et.
			</p>
			
			<p>
				The background images for the slider are set directly in the HTML
				using inline CSS. The rest of the styles for this template are
				contained within the
				<code>half-slider.css</code>
				file.
			</p>
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />



</body>

</html>