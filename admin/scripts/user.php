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
                
        // after succesfully creating a new user an email will be sent to the user
        // lettig them know their credentials, their email, password, username and a URL
        // to log in to their accounts

        // first we specify the subject of the email
        $subject = 'Your Account Credentials';

        // Then we specify the url link where the new user can log in
        $url = "http://localhost:8888/Calderon_J_3014_CMS/admin/index.php";

        // Next, we specify the headers
        $headers = "From: noreply@test.ca\r\n";
        // these next headers are important to display our email as HTML
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

        // Then we create the message where the user can see their password
        // username, email, and the link where they can log in
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
        

        // the mail function on PHP will handle and deliver the email to the new user
        mail($email, $subject, $message, $headers);

        redirect_to('index.php');
    }else{
        return 'The user did not go through';
    }
}
