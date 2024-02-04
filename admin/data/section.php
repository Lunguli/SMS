<?php 
// All Sections
function getAllSections($conn){
    $sql = "SELECT * FROM section";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    if($stmt->rowCount() >= 1){
        $sections = $stmt->fetchAll();
        return $sections;
    }else{
        return 0;
    }
}
//Get Section by ID
function getAllSectionById($section_id, $conn){
    $sql = "SELECT * FROM section WHERE section_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$section_id]);
    
    if($stmt->rowCount() == 1){
        $section = $stmt->fetch();
        return $section;
    } else {
        return 0;
    }
}

//DELETE
function removeSection($id, $conn){
    $sql = "DELETE FROM section WHERE section_id=? ";
    $stmt = $conn->prepare($sql);
    $rm   = $stmt->execute([$id]);
    if($rm){
        return 1;
    }else{
        return 0;
    }
}

?>