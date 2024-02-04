<?php
if (isset($_FILES['photo']) && $_FILES['photo']['error'] == UPLOAD_ERR_OK) {
    $target_dir = "../uploads/";  // Specify your target directory
    $target_file = $target_dir . basename($_FILES["photo"]["name"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Check if the file is an image
    $check = getimagesize($_FILES["photo"]["tmp_name"]);
    if ($check === false) {
        $em = "File is not an image.";
        header("Location: ../student-add.php?error=$em");
        exit;
    }

    // Check file size
    if ($_FILES["photo"]["size"] > 500000) {
        $em = "Sorry, your file is too large.";
        header("Location: ../student-add.php?error=$em");
        exit;
    }

    // Allow certain file formats
    $allowedFormats = ["jpg", "jpeg", "png", "gif"];
    if (!in_array($imageFileType, $allowedFormats)) {
        $em = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        header("Location: ../student-add.php?error=$em");
        exit;
    }

    // Move the uploaded file to the target directory
    if (!move_uploaded_file($_FILES["photo"]["tmp_name"], $target_file)) {
        $em = "Sorry, there was an error uploading your file.";
        header("Location: ../stud ent-add.php?error=$em");
        exit;
    }

    $photo_path = $target_file;
} else {
    // No file uploaded or an error occurred
    $photo_path = "";  // Provide a default photo path or handle as needed
}

session_start();
if(isset($_SESSION['admin_id']) && 
isset($_SESSION['role'])){

    if($_SESSION['role'] == 'Admin'){
        

if(isset($_POST['fname'])     &&
   isset($_POST['lname'])     &&
   isset($_POST['username'])  &&
   isset($_POST['pass'])      &&
   isset($_POST['address'])   &&
   isset($_POST['gender'])    &&
   isset($_POST['email_address'])  &&
   isset($_POST['date_of_birth'])  &&
   isset($_POST['parent_fname'])   &&
   isset($_POST['parent_lname'])   &&
   isset($_POST['parent_phone_number']) &&
   isset($_POST['photo']) &&
   isset($_POST['section'])   &&
   isset($_POST['grade'])) {

    include "../../DB_connection.php";
    include "../data/student.php";


    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $uname = $_POST['username'];
    $pass = $_POST['pass'];

    $address = $_POST['address'];
    $gender = $_POST['gender'];
    $email_address = $_POST['email_address'];
    $date_of_birth = $_POST['date_of_birth'];
    $parent_fname = $_POST['parent_fname'];
    $parent_lname = $_POST['parent_lname'];
    $parent_phone_number = $_POST['parent_phone_number'];

    $grade = $_POST['grade'];
    $section = $_POST['section'];
    
    
    $data = 'uname='.$uname.'&fname='.$fname.'&lname='.$lname.'address='.$address.'&gender='.$gender.
            '&email='.$email_address.'&pfn='.$parent_fname.'&pln='.$parent_lname.
            '&ppn='.$parent_phone_number;

    if(empty($fname)){
        $em = "First name is required";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    }else if(empty($lname)){
        $em = "An error occurred";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    
    }else if(empty($uname)){
        $em = "Username is required";
        header("Location: ../student-add.php?error=$em&$data");
        exit;

    }else if(!unameIsUnique($uname, $conn)){
        $em = "Username is taken! try another";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    
    }else if(empty($pass)){
        $em = "Password is required";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    }else if(empty($address)){
        $em = "Address is required";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    }else if(empty($gender)){
        $em = "Gender is required";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    }else if(empty($email_address)){
        $em = "Email address is required";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    }else if(empty($date_of_birth)){
        $em = "Date of birth is required";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    }else if(empty($parent_fname)){
        $em = "Parent first name is required";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    }else if(empty($parent_lname)){
        $em = "Parent last name is required";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    }else if(empty($parent_phone_number)){
        $em = "parent phone number is required";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    }else if(empty($section)){
        $em = "Section is required";
        header("Location: ../student-add.php?error=$em&$data");
        exit;
    }else{

        //hashing the password
        $pass = password_hash($pass, PASSWORD_DEFAULT);

        $sql = "INSERT INTO students(username, password, fname, lname, grade, section, address, gender, 
                email_address, date_of_birth, parent_fname, parent_lname, parent_phone_number, photo)
                VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        $stmt = $conn->prepare($sql);
        $stmt->execute([$uname, $pass, $fname, $lname, $grade, $section, $address, $gender, $email_address, 
                $date_of_birth, $parent_fname, $parent_lname, $parent_phone_number, $photo_path]);


        $sm = "New student registered successfully";
        header("Location: ../student-add.php?success=$sm");
        exit;
    }
    

}else{
    $em = "An error occurred";
    header("Location: ../student-add.php?error=$em");
    exit;
}

}else{
    header("Location: ../../logout.php");
    exit;
}

}else{
     header("Location: ../../logout.php");
     exit;
}



?>