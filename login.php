<?php 
include "DB_connection.php";
include "data/setting.php";
$setting = getSetting($conn);

if ($setting != 0) {

 ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Login to Alpha Academy School </title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" href="sch.jpg">
</head>
<body class= "body-login">
    <div class= "black-fill"> <br /> <br />
        <div class= "d-flex justify-content-center align-items-center flex-column">
        <form class= "login" 
              method="post"
              action="req/login.php">

            <div class= "text-center">
                <img src="sch.jpg" width="100">
            </div>
            <h3>LOGIN</h3>
            <!-- alert  -->
            <?php if(isset($_GET['error'])){ ?>
            
            <div class="alert alert-danger" role="alert">
            <?=$_GET['error'] ?> 
            </div>
            <?php } ?> 
          
            <div class= "mb-3">
            <label class= "form-label">Username</label>
            <input type="text"
                   class= "form-control"
                   name="uname">
        </div>

        <div class= "mb-3">
            <label class= "form-label">Password</label>
            <input type="password"
                   class= "form-control"
                   name="pass">
        </div>

        <div class= "mb-3">
            <label class= "form-label">Login As</label>
            <select class= "form-control"
                    name="role">
                <option value="1">Admin</option>
                <option value="2">Teacher</option>
                <option value="3">Student</option>
                <option value="4">Registrar Office</option>

            </select>
        </div>

        <button type="submit" class= "btn btn-primary">Login</button>
        <a href="index.php" class= "text-decoration-none">Home</a>
</form>
       <br /> <br /> <br />
       <div class="text-center text-light">
        	Copyright &copy; <?=$setting['current_year']?> <?=$setting['school_name']?>. All rights reserved.
          Developed By Lunguli James
        </div>
 </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<?php }else {
	header("Location: login.php");
	exit;
}  ?>
            