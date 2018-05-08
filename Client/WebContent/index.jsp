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
				<div class="carousel-item active" style="background-image:url('img/carousel/slide1.jpeg')">
				
					<div class="carousel-caption d-none d-md-block">
						<h3>First Slide</h3>
						<p>This is a description for the first slide.</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('img/carousel/slide2.jpeg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Second Slide</h3>
						<p>This is a description for the second slide.</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('img/carousel/slide3.jpeg')">
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