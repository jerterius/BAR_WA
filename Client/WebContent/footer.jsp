<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<style>

/#pageFooter{
	position: absolute;
	bottom: 0;
	width: 100%;
}


</style>

</head>
<body>

	<!-- Footer -->
	<footer class="py-5 bg-dark" name="pageFooter" id="pageFooter">
	<div class="container">

		<p class="m-0 text-center text-white">Timeout in:
			<span id="sessionCountdown" name="sessionCountdown"></span></p>


		<p class="m-0 text-center text-white">Copyright &copy; 
			Book A Room 2018</p>
	</div>
	<!-- /.container --> </footer>


<script>

// Set the date we're counting down to
var countDownDate = new Date().getTime()+ 6e5;

// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();
    
    // Find the distance between now an the count down date
    var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    //var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    //var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("sessionCountdown").innerHTML = minutes + "m " + seconds + "s ";
    
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("sessionCountdown").innerHTML = "EXPIRED";
    }
}, 1000);
</script>
</body>
</html>