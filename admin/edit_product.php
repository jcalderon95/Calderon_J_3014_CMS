<?php
require_once '../load.php';
confirm_logged_in();


$id = $_GET['id'];
$product = getOneProduct($id);

$tbl = 'tbl_category';
$categories = getAll($tbl);


if (isset($_POST['submit'])) {
    
    $productUpdate = array(
        'name'        =>  trim($_POST['name']),
        'id'          =>  trim($_POST['id']),
        'brand'       =>  trim($_POST['brand']),
        'price'       =>  trim($_POST['price']),
        'review'      =>  trim($_POST['review']),
        'description' =>  trim($_POST['description']),
        'category'    =>  trim($_POST['category']),
    );    

    $result  = updateProduct($productUpdate);
    $message = $result;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit Product</title>
</head>
<body>

<h2>Edit Product</h2>
    <?php echo !empty($message)? $message : '';?>
    <form action="edit_product.php" method="post">
        <?php while($info = $product->fetch(PDO::FETCH_ASSOC)): ?>
            <label>Product Image:</label><br>
            <img width="150px" src="../images/<?php echo $info['product_image'];?>" alt="<?php echo $info['product_name'];?> Image">
            <br>

            <label>Product Name:</label>
            <input required type="text" name="name" value="<?php echo $info['product_name'];?>"><br><br>

            <label>Product Price:</label>
            <input required type="text" name="price" value="<?php echo $info['product_price'];?>"><br><br>

            <label>Product Review:</label>
            <input required type="text" name="review" value="<?php echo $info['product_review'];?>"><br><br>

            <label>Product Brand:</label>
            <input required type="text" name="brand" value="<?php echo $info['product_brand'];?>"><br><br>

            <label>Product Description:</label>
            <input required type="text" name="description" value="<?php echo $info['product_description'];?>"><br><br>

            <label>Product Category:</label><br>
            <select name="category" required>
            <option value="">Please Select A Category</option>
            <?php while ($row = $categories->fetch(PDO::FETCH_ASSOC)): ?>
                <option value="<?php echo $row['category_id'] ?>"><?php echo $row['category_name']; ?></option>
            <?php endwhile;?>
            </select>

            <br><br>
            <input name="id" type="hidden" value="<?php echo $info['product_id'];?>">

        <?php endwhile;?>
        <button type="submit" name="submit">Edit Product</button>
    </form>
    <br><br>
    <a href="admin_editproduct.php">Go Back...</a>

</body>
</html>