<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="windowsup.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	
	
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link rel="stylesheet" href="css/st.css">
<link rel="stylesheet" href="css/photo.css">
<link rel="stylesheet" href="css/drawer.css">

</head>
<body>
<% if(session.getAttribute("subscriber_id")==null){
	response.sendRedirect("index.jsp");
}
%>

<%!All_Retriving_Methods m=new All_Retriving_Methods(); %>

<div id="my-navbar">								<!-- Drawer Container -->
    <div class="container-fluid ">
			<div class="row row2">
				<div class="col-xs-2" style="margin-top: 2px;">
					<h3 style="margin: 0px; margin-right: 10px;">
					<span class="smallnav menu" onclick="openNav()">
						 <span style="margin-top: 15px; margin-right: 2px; margin-left: 5px;"
							class="glyphicon glyphicon-menu-hamburger"></span>
					</span>	
					</h3>

				</div>
				<div class="col-xs-8"><span class="smallnav menu" onclick="openNav()"><h3> WindowsUp</h3></span></div>
				<div class="col-xs-2">
					<h4>
						<span
							style="margin-top: 5px; margin-right: 2px; margin-left: 5px;"
							class="glyphicon glyphicon-option-vertical"></span>
					</h4>
				</div>

			</div>
		</div>
</div>
	<div id="mySidenav" class="sidenav">
		<div class="container-fluid"
			style="background-color: #2874f0; padding-top: 10px;">
			<img class="profile-img " src="Img/sample.jpg" alt="Img"> 
 			<center> <span class="sidenav-heading">User Name</span>	</center>
			<!-- USER NAME HERE -->
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><span
				class="glyphicon glyphicon-menu-left"></span> </a>
		</div>

		<ul class="nav nav-pills nav-stacked nav-info">
			<li><a 
				href="notifications.jsp">Home</a></li>

			<li><a href="#">Profile</a></li>

			<li><a href="#">Setting</a></li>

			<li><a href="#">Past </a></li>

			<li class="nav-divider"></li>
		<li class="alert-danger"><a href="#"><div class="text-danger">Logout</div> </a></li>
			<li class="nav-divider"></li>

		</ul>
	</div>



	<div class="container-fluid">
		<!-- NavBar Container -->
		<div class="row">
			<div class="col-md-4 col-xs-0"></div>
			<div class="col-md-12  col-xs-12">
				<ul class="navbar-default nav nav-pills  ">
					<li style="float: left;" class="active"><a href="vehicles.jsp">Vehicles</a></li>
						<li style="margin-left: 13%;" ><a href="notifications.jsp">Notifications 
						<% 
						int UnReadMessages=m.getUnRead_Messages((int) session.getAttribute("subscriber_id")); 
						if(UnReadMessages>0){
						%>
						<span class="badge" style="background-color: #5cb85c; color: #fff;"><%=UnReadMessages %></span>
						<%}
						
						%>
						</a>
					</li>
					<li style="float: right;"><a href="permits.jsp">Permits</a></li>
				</ul>
			</div>
			<div class="col-md-4 col-xs-0"></div>
		</div>
		<!-- ROW 1 -->
	</div>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-xs-0"></div>
			
			<div class="col-md-4 col-xs-12">
				<div class="panel panel-info">			<!-- Panel start -->

					<div class="panel-heading">Add New Vehicle</div>

					<div class="panel-body">
						<form action = "AddVehicle" method="post" enctype="multipart/form-data">
				          
							<label for="rfidno">RFID No</label>
							<div class=" input-group">
								<input class="form-control " type="tel" placeholder="e.g. 2015000101" data-toggle="collapse" id="rfidno" name="rfidno" required>			
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-barcode"></i></span>
							</div>
							<br>
							<label for="regno">Registration No</label>
							<div class=" input-group">
								<input class="form-control "  type="text" placeholder="e.g. MH12AT7947" id="regno" name="regno" required>
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-list-alt"></i></span>
							</div>
								
							<br>
							<label for="make">Make</label>
							<div class=" input-group">
								<select class="selectpicker form-control" name="make" id="make"  required>
									 <option value="Select">Select</option>
									 <option value="Audi">Audi</option>
									 <option value="BMW">BMW</option>
									 <option value="Fiat">Fiat</option>
									 <option value="Honda">Honda</option>
									 <option value="Jeep">Jeep</option>
									 <option value="Mahindra">Mahindra</option>
									 <option value="Mercedes">Mercedes</option>
									 <option value="Renault">Renault</option>									 
  									 <option value="Suzuki">Suzuki</option>								 	
  									 <option value="Tata">Tata</option>
  															 
								</select>
												
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-pushpin"></i>
								</span>	
							</div>
							
							<br>
							<label for="model">Model</label>
							<div class=" input-group">
								<input class="form-control " type="text" placeholder="e.g. Swift" id="model" name="model" required>
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-comment"></i></span>
							</div>
									
							<br>
							<label for="photo">Photo</label>
							<!-- image-preview-filename input [CUT FROM HERE]-->
							<div class="input-group image-preview">
								<input type="text" class="form-control image-preview-filename"
									disabled="disabled" required>
								<!-- don't give a name === doesn't send on POST/GET -->
								<span class="input-group-btn"> <!-- image-preview-clear button -->
									<button type="button"
										class="btn btn-default image-preview-clear"
										style="display: none;">
										<span class="glyphicon glyphicon-remove"></span> Clear
									</button> <!-- image-preview-input -->
									<div class="btn btn-default image-preview-input">
										<span class="glyphicon glyphicon-camera"></span> <span
											class="image-preview-input-title"></span> <input
											type="file" accept="image/png, image/jpeg, image/gif"
											name="image" id="photo" required />
										<!-- rename it -->
									</div>
								</span>
							</div>
							<!-- /input-group image-preview [TO HERE]-->
						
							
							
							
							<br>
							<input class="form-control btn btn-success" type="submit"   value="Add">
						
						</form>	
					</div>
					
			
				</div>	
				
			</div>
			<div class="col-md-4 col-xs-0"></div>
		</div>

	</div>





<script type="text/javascript">
function openNav() {
    document.getElementById("mySidenav").style.width = "70%";
    // document.getElementById("flipkart-navbar").style.width = "50%";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.body.style.backgroundColor = "rgba(0,0,0,0)";
}

</script>

<script>

    // Run on page load
    window.onload = function() {

        // If sessionStorage is storing default values (ex. name), exit the function and do not restore data
        if (sessionStorage.getItem('rfidno') == "rfidno") {
            return;
        }

        // If values are not blank, restore them to the fields
        var rfidno = sessionStorage.getItem('rfidno');
        if (rfidno !== null) $('#rfidno').val(rfidno);

        var regno = sessionStorage.getItem('regno');
        if (regno !== null) $('#regno').val(regno);

        var make= sessionStorage.getItem('make');
        if (make!== null) $('#make').val(make);

        var model= sessionStorage.getItem('model');
        if (model!== null) $('#model').val(model);
        
        var photo= sessionStorage.getItem('photo');
        if (photo!== null) $('#photo').val(photo);
        

        
    }

    // Before refreshing the page, save the form data to sessionStorage
    window.onbeforeunload = function() {
        sessionStorage.setItem("rfidno", $('#rfidno').val());
        sessionStorage.setItem("regno", $('#regno').val());
        sessionStorage.setItem("make", $('#make').val());
        sessionStorage.setItem("model", $('#model').val());
        sessionStorage.setItem("photo", $('#photo').val());

    }
</script>




		<script
			src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
		<script src="js/photo.js"></script>
		<script src="js/index.js"></script>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
</body>
</html>