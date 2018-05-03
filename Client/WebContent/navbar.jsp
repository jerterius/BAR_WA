<%@page import="group25.ejb.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%
			Customer c = (Customer) session.getAttribute("currentSessionUser");
		%>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-blue fixed-top">
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
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Test</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>



						<%
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

</body>
</html>