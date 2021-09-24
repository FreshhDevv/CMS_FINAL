<?php

function redirect($location) {
    return header("Location:" . $location);
}

function escape($string) {
    global $connection;
    mysqli_real_escape_string($connection, trim($string));
}



function users_online() {

    if(isset($_GET['onlineusers'])) {

    global $connection;
     
    if(!$connection) {
        session_start();
        include "../Includes/db.php";

        $session = session_id();
        $time = time();
        $time_out_in_seconds = 05;
        $time_out = $time - $time_out_in_seconds;

        $query = "SELECT * FROM users_online WHERE session = '$session'";
        $send_query = mysqli_query($connection, $query);
        $count = mysqli_num_rows($send_query);

            if($count == NULL) {
                mysqli_query($connection, "INSERT INTO users_online(session, time) VALUES('$session', '$time')");
            } else {
                mysqli_query($connection, "UPDATE users_online SET time = '$time' WHERE session = '$session'");
            }
        $users_online_query = mysqli_query($connection, "SELECT * FROM users_online WHERE time > '$time_out'");
        echo $count_user = mysqli_num_rows($users_online_query);

    }
 
} //get request isset()
}

users_online();

function confirmQuery($result) {
    global $connection;
    if(!$result) {
        die("QUERY FAILED". mysqli_error($connection));
    }
    

}

function insert_categories() {

    global $connection;
    
    if(isset($_POST['submit'])) {
        $cat_title = $_POST['cat_title'];

        if($cat_title == "" || empty($cat_title)) {
            echo "This field should not be empty";
        } else {
            $query = "INSERT INTO categories(cat_title) ";
            $query .= "VALUE('{$cat_title}') ";

            $create_category_query = mysqli_query($connection, $query);

            if(!$create_category_query) {
                die("QUERY FAILED". mysqli_error($connection));
            }
        }
    }
}

function findAllCategories() {
    global $connection;
    $query = "SELECT * FROM categories"; //use "LIMIT 3" if you want to limit the number of categories displayed on the sidebar to 3
    $select_categories = mysqli_query($connection, $query);

    while($row = mysqli_fetch_assoc($select_categories)) {
        $cat_id = $row['cat_id'];
        $cat_title = $row['cat_title'];

        echo "<tr>";
        echo "<td>{$cat_id}</td>";
        echo "<td>{$cat_title}</td>";
        echo "<td><a href='categories.php?edit={$cat_id}'>Edit</a></td>";
        echo "<td><a href='categories.php?delete={$cat_id}'>Delete</a></td>";
        echo "</tr>";
    
    }
}

function deleteCategories() {
    global $connection;
    if(isset($_GET['delete'])){
        $the_cat_id = $_GET['delete'];

        $query = "DELETE FROM categories WHERE cat_id = {$the_cat_id}";
        $delete_query = mysqli_query($connection, $query);
        header("Location:categories.php");
    }

}


function recordCount($table) {
    global $connection;

    $query = "SELECT * FROM " . $table;
    $select_all_post = mysqli_query($connection, $query);

    $result = mysqli_num_rows($select_all_post);

    confirmQuery($result);
    return $result;
}

function checkStatus($table, $column, $status) {
    global $connection;;
    $query = "SELECT * FROM $table WHERE $column = '$status'";
    $result = mysqli_query($connection, $query);
    confirmQuery($result);
    return mysqli_num_rows($result);

}

function checkUserRole($table, $column, $role) {
    global $connection;

    $query = "SELECT * FROM $table WHERE $column = '$role'";
    $select_all_subscribers = mysqli_query($connection, $query);
    return mysqli_num_rows($select_all_subscribers);
}

function is_admin($username) {
    global $connection;

    $query = "SELECT user_role FROM users WHERE username = '$username'";
    
    $result = mysqli_query($connection, $query);
    confirmQuery($result);

    $row = mysqli_fetch_array($result);

    if($row['user_role'] == 'admin') {
        return true;
    } else {
        return false;
    }
}

function username_exists($username) {

    global $connection;

    $query = "SELECT username FROM users WHERE username = '$username'";
    
    $result = mysqli_query($connection, $query);
    confirmQuery($result);

    if(mysqli_num_rows($result) > 0) {
        return true;
    } else {
        return false;
    }


}

function email_exists($email) {

    global $connection;

    $query = "SELECT user_email FROM users WHERE user_email = '$email'";
    
    $result = mysqli_query($connection, $query);
    confirmQuery($result);

    if(mysqli_num_rows($result) > 0) {
        return true;
    } else {
        return false;
    }


}

function register_user($username, $user_firstname, $user_lastname, $email, $password) {
    global $connection; 


    $username = $_POST['username'];
    $user_firstname = $_POST['user_firstname'];
    $user_lastname = $_POST['user_lastname'];
    $email = $_POST['email'];
    $password = $_POST['password'];


    if(email_exists($email)) {
        
    }





    if(!empty($username) && !empty($user_firstname) && !empty($user_lastname) && !empty($email) &&!empty($password)) {


        $username = mysqli_real_escape_string($connection, $username);
        $user_firstname = mysqli_real_escape_string($connection, $user_firstname);
        $user_lastname = mysqli_real_escape_string($connection, $user_lastname);
        $email = mysqli_real_escape_string($connection, $email);
        $password = mysqli_real_escape_string($connection, $password);

        $password = password_hash($password, PASSWORD_BCRYPT, array('cost'=>12) );






        $query = "INSERT INTO users (username, user_firstname, user_lastname, user_email, user_password, user_role) ";
        $query .= "VALUES ('{$username}', '{$user_firstname}','{$user_lastname}','{$email}','{$password}','subscriber' )";
        $register_user_query = mysqli_query($connection, $query);
        
        confirmQuery($register_user_query);

    //$message = "Your registration has been submitted";

    } 



}
