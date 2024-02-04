<?php 
// All Classes
function getAllClasses($conn){
    $sql = "SELECT * FROM class";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    if($stmt->rowCount() >= 1){
        $classes = $stmt->fetchAll();
        return $classes;
    }else{
        return 0;
    }
}
//Get Class by ID
function getAllClassById($class_id, $conn){
    $sql = "SELECT * FROM class WHERE class_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$class_id]);
    
    if($stmt->rowCount() == 1){
        $class = $stmt->fetch();
        return $class;
    } else {
        return 0;
    }
}

//DELETE
function removeClass($id, $conn){
    $sql = "DELETE FROM class WHERE class_id=? ";
    $stmt = $conn->prepare($sql);
    $rm   = $stmt->execute([$id]);
    if($rm){
        return 1;
    }else{
        return 0;
    }
}

?>