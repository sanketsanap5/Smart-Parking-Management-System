<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<title>Edit Profile</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/index.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="Refresh" content="3">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link rel="stylesheet" href="css/st.css">
<link rel="stylesheet" href="css/drawer.css">

<style type="text/css">
.btn file
{
position: relative;
overflow: hidden;
}
.btn-file input[type=file]
{
position: absolute;
top: 0;
right: 0;
min-width: 100%;
min-height: 100%;
text-align: right;
opacity: 0;
background: white;
cursor: inherit;
display: block;

}
#img-upload
{
width: 100%;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	
	$(document).on('change','.btn-file :file',function(){
		
		var input=$(this),
		label=input.val().replace(/\\/g, '/').replace(/.*\//, '');
		input.trigger('fileselect',[label]);	
	});
	
	$('.btn-file :file').on('fileselect',function (event,label)
	{
		
		var input=$(this).parents('.input-group').find(':text'),
		log=label;
		if(input.length)
			{
			input.val(log);
			}
		else{
			if(log) alert(log);
			
		}
	
});
/*
function readURL(input) {
	if(input.files && input.files[0])
		{
		var reader=new FileReader();
		reader.onload=function(e)
		{
			$('#img-upload').attr('src',e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
		}
}
$('$imgInp').change(function ()
		{
	readURL(this);
		});
		*/
});


</script>
</head>
<body>
<input type="hidden" id="uname" value='<%=session.getAttribute("Email")%>'>

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
		<div class="container"
			style="background-color: #2874f0; padding-top: 10px;">
			<img class="profile-img " id="profile-photo" src="" alt="...">
			 <center> <span class="sidenav-heading"><%=session.getAttribute("Email") %></span>	</center>
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



<div class="container-fluid">				<!-- NavBar Container -->
	<div class="row"> 
			<div class="col-md-4 col-xs-0"></div>
			<div class="col-md-12  col-xs-12">
				<ul class="navbar-default nav nav-pills  ">
					<li style="float: left;" class="active"><a href="#">Vehicles</a></li>
					<li style="margin-left: 13%; margin-right: 4%;" ><a href="notifications.jsp">Notifications</a></li>
					<li style="float: right;" ><a href="permits.jsp">Permits</a></li>
				</ul>
			</div>
			<div class="col-md-4 col-xs-0"></div>
			<br> <br>
	</div>	<!-- ROW 1 --> 
</div>		
		
		
<div class="container">
	<div class="col-md-6">
	
	<center><p style="color: ${param.color};">${param.message} </p></center>
	
	<form action="Edit_Profile" method="post" enctype="multipart/form-data">
		<div class="form-group">
		
		        <br/>
		        <br/>
	         	<div class="form-group">
                
                <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-user"></i>
                </span>
                <label> Gender</label>
		        <select id="gendre" name="gendre" data-show-icon="true">
		           <option   value="select" >Select...</option>
		        	<option   value="female" >Female</option>
		        	<option value="male"> Male</option>
		        </select>
                </div>
                </div>
		        <br>
		        
		        <div class="form-group">
		        <label> Date Of Birth </label>
                <div class="input-group">
                <span class="input-group-addon">
                	<div class=" registration-date">
								<div class="input-group registration-date-time">
									<input class="form-control" name="dob"
										id="registration-date" type="date" > 
									<span class="input-group-addon" id="basic-addon1"><span
										class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>	
								</div>
							</div>
               
                </span> 
               
                </div>
                </div>
		        <br>
		        
		        
		        
		      
		        
	         	<div class="form-group">
                <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-home"></i>
                </span>
                <input type="text" name="address1" class="form-control" placeholder="Address Line 1" required  >
                </div>
                </div>
                <br/>
                
                <div class="form-group">
               
                <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-home"></i>
                </span>
                <input type="text" name="address2" class="form-control" placeholder="Address Line 2" > 
                </div>
                 </div>
                <br>
           
                <div class="form-group">
                <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-home"></i>
                </span>
                <input type="text" name="address3" class="form-control" placeholder="Address Line 3"   >
                </div>
                </div>
                <br/>
               
   
                <div class="form-group">
                <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-credit-card"></i>
                </span>
                <input type="text" name="dlno" class="form-control" placeholder="Driving Licence Number"   >
                </div>
                </div>
                <br/>
                
              	
		<label>Upload Photo</label>
		<div class="input-group">
			<span class="glyphicon glyphicon-folder-open">
				<span class="btn btn-default btn-file">
				Browse...<input type="file" name="ImgInp" id="ImgInp" accept="image/*">
				</span>
			</span>
			<input type="text" class="form-control" readonly>
			<!-- <img id='img-upload' src=""/> -->
		    </div>
		        <center><button class="btn icon-btn btn-group btn-group-xs btn-info " type="submit">
                Submit</button>
                </center>
		</div>
		</form>
		</div>
		</div>
		<script type="text/javascript">
		
		function getPhoto() {
			var uname=document.getElementById("uname").value;
			document.getElementById("profile-photo").src="Get_Image_Profile.jsp?email="+uname;

		}

		window.onload=getPhoto;
		
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
	

</body>
</html>