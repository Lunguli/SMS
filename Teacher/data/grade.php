<?php 
// All Grades
function getAllGrades($conn){
    $sql = "SELECT * FROM grades";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    if($stmt->rowCount() >= 1){
        $grades = $stmt->fetchAll();
        return $grades;
    }else{
        return 0;
    }
}
//Get Grade by ID
function getAllGradeById($grade_id, $conn){
    $sql = "SELECT * FROM grades WHERE grade_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$grade_id]);
    
    if($stmt->rowCount() == 1){
        $grade = $stmt->fetch();
        return $grade;
    } else {
        return 0;
    }
}

//DELETE
function removeGrade($id, $conn){
    $sql = "DELETE FROM grades WHERE grade_id=? ";
    $stmt = $conn->prepare($sql);
    $rm   = $stmt->execute([$id]);
    if($rm){
        return 1;
    }else{
        return 0;
    }
}

?>