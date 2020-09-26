<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link rel="stylesheet" href="css/st.css">



<title>Index</title>


<script type="text/javascript">



function getPhoto() {
	var uname=document.getElementById("Email").value;
	document.getElementById("profile-photo").src="Get_Image_Profile.jsp?email="+uname;

}
function showPassword() {
	var x=document.getElementById("Password-id");
	if(x.type === "password")
		{
		x.type="text";
		}
	else
		{
		x.type="password";
		}
	}



</script>
<style type="text/css">
.field-icon
{
float:right;
margin-left: -25px;
margin-top: -25px;
position: relative;
z-index: 2;
}
</style>
</head>
<body>
<% 
	/*Cookie[] cookies =request.getCookies();
	if(cookies!=null){	
			System.out.println(cookies[0].getValue());	
	}*/
	
	

%>
<div class="container">
	<br>
	<br>
    <div class="row" >
    <div class="col-md-4 col-xs-0">								<!-- COL 1 --> </div>
    
    
       
         	<center><p style="color: ${param.color};">${param.message} </p></center>
     
            <h1 class="text-center login-title">Login</h1>
            <div class="panel">
            	<center><div class="panel-heading">
            	    <img class="img-circle " id="profile-photo" width="150px;" height="130px" class="profile-img.java" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                    alt=""></div>
                    </center>
                <form class="well form-login" action="Login" method="post"">
           		<div class="panel-body">
               
               
              
                <div class="form-group input-group">
                <div class="input-group-addon">
                <span class="glyphicon glyphicon-user"></span>
                </div>
                <input type="email" name="Email" id="Email" class="form-control" placeholder="Email" onfocusout="getPhoto()" required style="width: 250px;">
               </div>
                <br>
            
              
                <div class="form-group input-group">
                <div class="input-group-addon">
                <span class="glyphicon glyphicon-lock"></span>
                </div>
                <input type="password" name="Password" id="Password-id" class="form-control pwd"  placeholder="Password" required autofcus style="width: 250px;"  data-toggle="password">
                  
                           
               </div>
                 <br/>
                <input type="checkbox" onclick="showPassword()" > Show Password 
              
               </div>
                
                <br>
                <center>  <button class="btn icon-btn btn-group btn-group-xs btn-info " type="submit">
                    Log in</button></center>
            </form>
              </div>
             
                <div class="panel-footer">
                	<a href="Register_User.jsp" class="text-center new-account">Create an account </a>
                	<a href="Forgot_Password.jsp" class="text-center new-account">Forgot Password? </a><span class="clearfix"></span>
                    <a href="#" class="text-center new-account">Need help? </a><span class="clearfix"></span>
             
         
            	</div>
                  
            </div>
        </div>
         <div class="col-md-4 col-xs-0">								<!-- COL 1 --> </div>
    

	

</body>
</html>