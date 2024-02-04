<?php  
//get all Subjects
function getAllSubjects($conn){
    $sql = "SELECT * FROM subject";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    if($stmt->rowCount() >= 1){
        $subjects = $stmt->fetchAll();
        return $subjects;
    }else{
        return 0;
    }
}


//Get Subjects by ID
function getSubjectById($subject_id, $conn){
    $sql = "SELECT * FROM subject WHERE subject_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$subject_id]);

    if($stmt->rowCount() == 1){
        $subject = $stmt->fetch();
        return $subject;
    } else {
        return 0;
    }
}

//DELETE course
function removeCourse($id, $conn){
    $sql = "DELETE FROM subject WHERE subject_id=? ";
    $stmt = $conn->prepare($sql);
    $rm   = $stmt->execute([$id]);
    if($rm){
        return 1;
    }else{
        return 0;
    }
}

?>
