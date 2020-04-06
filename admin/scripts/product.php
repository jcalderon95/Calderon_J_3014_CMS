<?php

function addProduct($product)
{
    try {
        // 1. Connect to the DB
        $pdo = Database::getInstance()->getConnection();

        // 2. Validate the uploaded file
        $image          = $product['image'];
        $upload_file    = pathinfo($image['name']);
        $accepted_types = array('gif', 'jpg', 'jpe', 'png', 'jpeg', 'webp');
        if (!in_array($upload_file['extension'], $accepted_types)) {
            throw new Exception('Wrong file type!');
        }

        // 3. Move the uploaded file around (move the file from tmp path to the /images)
        $image_path = '../images/';

        // Randomlize/hash the file name before move it over!
        $generated_name     = md5($upload_file['filename'] . time());
        $generated_filename = $generated_name . '.' . $upload_file['extension'];
        $targetpath         = $image_path . $generated_filename;

        if (!move_uploaded_file($image['tmp_name'], $targetpath)) {
            throw new Exception('Failed to move uploaded file, check permission!');
        }

        // 4. Insert into DB (tbl_movies as well as tbl_mov_genre)
        $insert_product_query = 'INSERT INTO tbl_products (product_name, product_price, product_review, product_brand, product_description, product_image)';
        $insert_product_query .= ' VALUES (:product_name,:product_price,:product_review,:product_brand,:product_description,:product_image)';
        $insert_product        = $pdo->prepare($insert_product_query);
        $insert_product_result = $insert_product->execute(
            array(
                ':product_image'       => $generated_filename,
                ':product_name'        => $product['name'],
                ':product_price'       => $product['price'],
                ':product_review'      => $product['review'],
                ':product_description' => $product['description'],
                ':product_brand'       => $product['brand']
            )
        );

        $last_uploaded_id = $pdo->lastInsertId();
        if ($insert_product_result && !empty($last_uploaded_id)) {
            $update_category_query = 'INSERT INTO tbl_product_category(product_id, category_id) VALUES (:product_id, :category_id)';
            $update_category       = $pdo->prepare($update_category_query);

            $update_category_result = $update_category->execute(
                array(
                    ':product_id' => $last_uploaded_id,
                    ':category_id'  => $product['category'],
                )
            );
        }

        // 5. If all of above works, redirect user to index.php
        redirect_to('index.php');
    } catch (Exception $e) {
        // Otherwise, return some error message
        $error = $e->getMessage();
        return $error;
    }
}

function deleteProduct($id){
    $pdo = Database::getInstance()->getConnection();
    $delete_product_query = 'SELECT * FROM tbl_products WHERE product_id = :id; ';
    $delete_product_query .= 'DELETE FROM tbl_product_category WHERE product_id = :id; DELETE FROM tbl_products WHERE product_id = :id';
    $delete_product_set = $pdo->prepare($delete_product_query);
    $delete_product_result = $delete_product_set->execute(
        array(
            ':id'=>$id
        )
    );
    
    while($found_product = $delete_product_set->fetch(PDO::FETCH_ASSOC)){
        
        $path = "../images/" . $found_product['product_image'];
        unlink($path);

    }

    //If everything went through, redirect to admin_deleteproduct.php
    //Otherwise, return false
    if($delete_product_result && $delete_product_set->rowCount() > 0){
        redirect_to('admin_deleteproduct.php');
    }else{
        return false;
    }
}

function getOneProduct($id){
    $pdo = Database::getInstance()->getConnection();

    $get_product_query = 'SELECT * FROM tbl_products WHERE product_id = :id';
    $get_product_set = $pdo->prepare($get_product_query);
    $get_product_result = $get_product_set->execute(
        array(
            ':id'=>$id
        )
    );

    if($get_product_result){
        return $get_product_set;
    }else{
        return 'There was a problem accessing the user';
    }
}

function updateProduct($productUpdate){
    $pdo = Database::getInstance()->getConnection();

    $update_product_query = 'UPDATE tbl_products SET product_name = :product_name, product_price = :product_price, product_review = :product_review,';
    $update_product_query .= ' product_brand = :product_brand, product_description = :product_description WHERE product_id = :id ;';
    $update_product_query .= ' UPDATE tbl_product_category SET category_id = :category_id WHERE product_id = :id';
    $update_product        = $pdo->prepare($update_product_query);
    $update_product_result = $update_product->execute(
        array(
            ':id'                  => $productUpdate['id'],
            ':product_name'        => $productUpdate['name'],
            ':product_price'       => $productUpdate['price'],
            ':product_review'      => $productUpdate['review'],
            ':product_description' => $productUpdate['description'],
            ':category_id'         => $productUpdate['category'],
            ':product_brand'       => $productUpdate['brand']
        )
    );

    if($update_product_result){
        redirect_to('admin_editproduct.php');
    }else{

        return 'Guess you got canned...';
    }


}