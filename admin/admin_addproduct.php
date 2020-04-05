<?php
require_once '../load.php';
confirm_logged_in();

$category_table = 'tbl_category';
$categories     = getAll($category_table);

if (isset($_POST['submit'])) {
    $product = array(
        'image'       =>  $_FILES['image'],
        'name'        =>  trim($_POST['name']),
        'brand'        =>  trim($_POST['brand']),
        'price'       =>  trim($_POST['price']),
        'review'      =>  trim($_POST['review']),
        'description' =>  trim($_POST['description']),
        'category'    =>  trim($_POST['category']),
    );
 
    $result  = addProduct($product);
    $message = $result;
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
</head>
<body>
    <?php echo !empty($message) ? $message : ''; ?>
    <form action="admin_addproduct.php" method="post" enctype="multipart/form-data">
        <label>Product Image:</label><br>
        <input type="file" name="image" value=""><br><br>

        <label>Product Name:</label><br>
        <input type="text" name="name" value=""><br><br>

        <label>Product Brand:</label><br>
        <input type="text" name="brand" value=""><br><br>

        <label>Product Price:</label><br>
        <input type="text" name="price" value=""><br><br>

        <label>Product Review:</label><br>
        <input type="text" name="review" value=""><br><br>

        <label>Product Description:</label><br>
        <textarea name="description"></textarea><br><br>

        <label>Product Category:</label><br>
        <select name="category">
            <option>Please Select A Category</option>
            <?php while ($row = $categories->fetch(PDO::FETCH_ASSOC)): ?>
                <option value="<?php echo $row['category_id'] ?>"><?php echo $row['category_name']; ?></option>
            <?php endwhile;?>
        </select>
        <br><br>
        <button type="submit" name="submit">Add Movie</button>
    </form>

    <br><br>
    <a href="index.php">Go Back...</a>
    
</body>
</html>