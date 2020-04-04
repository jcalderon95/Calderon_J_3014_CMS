<?php 
function createUser($fname, $username, $password, $email){
    $pdo = Database::getInstance()->getConnection();
    
    //TODO: finish the below so that it can run a SQL query
    // to create a new user with provided data
    $create_user_query = 'INSERT INTO tbl_user(user_fname, user_name, user_pass, user_email, user_ip, first_login)';
    $create_user_query .= ' VALUES(:fname, :username, :password, :email, "no", 0 )';

    $create_user_set = $pdo->prepare($create_user_query);
    $create_user_result = $create_user_set->execute(
        array(
            ':fname'=>$fname,
            ':username'=>$username,
            ':password'=>$password,
            ':email'=>$email,
        )
    );

    if($create_user_result){
                
        $subject = 'Your Account Credentials';

        $url = "http://localhost:8888/Calderon_J_3014_CMS/admin/index.php";

        $headers = "From: noreply@test.ca\r\n";
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

        $message = '<html><body>';
        $message .= '<table rules="all" style="border-color: #666;" cellpadding="10">';
        $message .= "<tr style='background: #eee;'><td><strong>Name:</strong> </td><td>" . $fname . "</td></tr>";
        $message .= "<tr><td><strong>Email:</strong> </td><td>" . $email . "</td></tr>";
        $message .= "<tr><td><strong>Username:</strong> </td><td>" . $username . "</td></tr>";
        $message .= "<tr><td><strong>Password:</strong> </td><td>" . $password . "</td></tr>";
        $message .= "<h3>Click here to log in:<h3>";
        $message .= "<a href=".$url.">Log In</a>";
        $message .= "</table>";
        $message .= "</body></html>";
        
        mail($email, $subject, $message, $headers);

        redirect_to('index.php');
    }else{
        return 'The user did not go through';
    }
}

function getSingleUser($id){
    $pdo = Database::getInstance()->getConnection();

    $get_user_query = 'SELECT * FROM tbl_user WHERE user_id = :id';
    $get_user_set = $pdo->prepare($get_user_query);
    $get_user_result = $get_user_set->execute(
        array(
            ':id'=>$id
        )
    );

    if($get_user_result){
        return $get_user_set;
    }else{
        return 'There was a problem accessing the user';
    }
}

function editUser($id, $fname, $username, $password, $email){
    $pdo = Database::getInstance()->getConnection();

    $update_user_query = 'UPDATE tbl_user SET user_fname = :fname, user_name = :username,';
    $update_user_query .= ' user_pass=:password, user_email =:email,';
    $update_user_query .= ' first_login = 1 WHERE user_id = :id';
    $update_user_set = $pdo->prepare($update_user_query);
    $update_user_result = $update_user_set->execute(
        array(
            ':fname'=>$fname,
            ':username'=>$username,
            ':password'=>$password,
            ':email'=>$email,
            ':id'=>$id
        )
    );

    // echo $update_user_set->debugDumpParams();
    // exit;

    if($update_user_result){
        redirect_to('index.php');
    }else{
        return 'There was an error updating the user...';
    }
}