<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error Page</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<meta name="viewport" content="width=device-width=, inital-scale=1.0">
<meta http-equiv="Refresh" content="3">

</head>
<body>
<% if(session.getAttribute("subscriber_id")==null){
	response.sendRedirect("index.jsp");
}
%>
	



	<div class="container-fluid">
		<div class="row">													<!-- ROW 1 START -->
			<div class="col-md-8 col-xs-12">											<!-- COL 1 -->
				
				
			</div>									
												
			
		</div>																<!-- ROW 1 END -->
	
	</div>																	<!-- Container 1 END -->

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-xs-0"></div>
			<div class="col-md-4 col-xs-12">
			<center>	<a  href="notifications.jsp" > <img alt="Img" src="Img/error.jpg"></a></center>
			<div class="alert alert-warning" role="alert">
				<center>	<a href="notifications.jsp" class="alert-link">Sorry for the inconvenience . . .Please Try Again!!</a></center>
				</div>
			</div>
				<div class="col-md-4 col-xs-0"></div>
		</div>
	
	</div>
	

	<script src="js/jquery.min.js"> </script>
	<script src="js/bootstrap.min.js"> </script>

</body>
</html>