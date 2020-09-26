<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link rel="stylesheet" href="css/st.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">

   <script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/index.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>


<script type="text/javascript">

function validate()
{
	return true;
}
</script>

<title>User Registration</title>
</head>
<body>
<div class="container">
	<br>
	<br>
    <div class="row">
    <div class="col-md-4 col-xs-0">								<!-- COL 1 --> </div>
        <div class="col-md-4 col-xs-12">
           
            <h1 class="text-center login-title">User Registration</h1>

<div class="panel-body">
                 <form class="well form-horizontal" action="Register_User" method="post">
                 
                 <div class="form-group">
                 <div class="col-md-4 inputGroupContainer">
                 <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-user"></i>
                </span>
                <input type="text" name="Full_Name" class="form-control" placeholder="Full Name" required  style="width: 250px;">
                <br>
                </div>
                </div>
                </div>
                <br/>
                
                 <div class="form-group">
                 <div class="col-md-4 inputGroupContainer">
                 <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-envelope"></i>
                </span>
                <input type="email" name="Email" class="form-control" placeholder="Email" required  style="width: 250px;">
                <br>
                </div>
                </div>
                </div>
                <br/>
                
                 <div class="form-group">
                 <div class="col-md-4 inputGroupContainer">
                 <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-phone"></i>
                </span>
                <input type="text" name="Mobile_No" class="form-control" placeholder="Mobile No" maxlength="10" required  style="width: 250px;">
                <br>
                </div>
                </div>
                </div>
                <br/>
                
                 <div class="form-group">
                 <div class="col-md-4 inputGroupContainer">
                 <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-lock"></i>
                </span>
                <input type="password" name="Password" class="form-control" placeholder="Password"  required  style="width: 250px;">
                <br>
                </div>
                </div>
                </div>
                <br/>
                
                <div class="form-group">
                 <div class="col-md-4 inputGroupContainer">
                 <div class="input-group">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-lock"></i>
                </span>
                <input type="password" name="CPassword" class="form-control" placeholder="Re-enter Password"  required  style="width: 250px;">
                <br>
                </div>
                </div>
                </div>
                <br/>
                
                
                
                
               
                <button class="btn icon-btn btn-group btn-group-xs btn-info " type="submit" oncilk="validate()">
                   Submit
                    <span class="glyphicon glyphicon-send">
                   </span>
                   </button>
                  
                </form>
 </div>
                 
</div>

</div>
</div>






</body>
</html>