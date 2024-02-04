<?php

//Get registrar_user by ID
function getAllR_usersById($r_user_id, $conn){
    $sql = "SELECT * FROM registrar_office WHERE r_user_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$r_user_id]);
    if($stmt->rowCount() == 1){
        $r_user = $stmt->fetch();
        return $r_user;
    } else {
        return 0;
    }
}
//get all teachers
function getAllR_users($conn){
    $sql = "SELECT * FROM registrar_office";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    if($stmt->rowCount() >= 1){
        $r_users = $stmt->fetchAll();
        return $r_users;
    }else{
        return 0;
    }
}

//check if username is unique and teacher_id
function unameIsUnique($uname, $conn, $r_user_id=0){
    $sql = "SELECT username, r_user_id FROM registrar_office WHERE username=? ";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$uname]);

    if($r_user_id == 0){
        if($stmt->rowCount() >= 1){
           return 0;
        }else{
           return 1;
        }
    }else{
        if($stmt->rowCount() == 1){
           $r_user = $stmt->fetch();
           if($r_user['r_user_id'] == $r_user_id){
            return 1;
           }else return 0;
        }else{
          return 1;
        }
    }
    
}

//DELETE
function removeR_user($id, $conn){
    $sql = "DELETE FROM registrar_office WHERE r_user_id=? ";
    $stmt = $conn->prepare($sql);
    $rm   = $stmt->execute([$id]);
    if($rm){
        return 1;
    }else{
        return 0;
    }
}