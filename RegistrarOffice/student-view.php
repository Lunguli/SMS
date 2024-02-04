<?php  
session_start();
if(isset($_SESSION['r_user_id']) && 
isset($_SESSION['role'])){

    if($_SESSION['role'] == 'Registrar Office'){
        include "../DB_connection.php";
        include "data/student.php";
        include "data/subject.php";
        include "data/grade.php";
        include "data/section.php";

        if(isset($_GET['student_id'])){

        $student_id = $_GET['student_id'];
        $student = getAllStudentById($student_id, $conn);
       
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Registrar Office - View Student </title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="icon" href="../sch.jpg">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

    <?php  

         if($student != 0){

    ?>
    <div class="container mt-5">
     
      <div class="card" style="width: 22rem;">
     <img src="../img/male.png" class= " card-img-top" alt="...">
      <div class="card-body">
     <h5 class="card-title text-center">@<?=$student['username']?></h5>
     </div> 
     <ul class="list-group list-group-flush">
    <li class="list-group-item">First name:  <?=$student['fname']?></li>
    <li class="list-group-item">Last name:  <?=$student['lname']?></li>
    <li class="list-group-item">Username:  <?=$student['username']?></li>
    <li class="list-group-item">Address:  <?=$student['address']?></li>
    <li class="list-group-item">Date of birth:  <?=$student['date_of_birth']?></li>
    <li class="list-group-item">Email address:  <?=$student['email_address']?></li>
    <li class="list-group-item">Gender:  <?=$student['gender']?></li>
    <li class="list-group-item">Date of joined:  <?=$student['date_of_joined']?></li>

    <li class="list-group-item">Class: 
        <?php 
           $grade = $student['grade'];
           $g = getAllGradeById($grade, $conn);
           echo $g['grade_code'].'-'.$g['grade'];

        ?>
    </li>

    <li class="list-group-item">Section: 
        <?php 
        $section = $student['section'];
        $s = getAllSectionById($section, $conn);
        echo $s['section'];
           

         ?>
    </li>
    <br><hr>
    <li class="list-group-item">Parent first name:  <?=$student['parent_fname']?></li>
    <li class="list-group-item">Parent last name:  <?=$student['parent_lname']?></li>
    <li class="list-group-item">Parent phone number:  <?=$student['parent_phone_number']?></li>



    </ul>
    <div class="card-body">
    <a href="student.php" class="card-link">Go Back</a>
    </div>
   </div>
</div>
     <?php  
         }else{
            header("Location: student.php");
            exit;
         }
    ?>
   

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function(){
         $("#navlinks li:nth-child(1) a") .addClass('active');
        });
    </script>

</body>
</html>

<?php
}else{
    header("Location: student.php");
    exit;
 }

}else{
    header("Location: ../login.php");
    exit;
}

}else{
     header("Location: ../login.php");
     exit;
}


?>