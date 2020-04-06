<?php 
    require_once '../load.php';
    confirm_logged_in();

    $products_table = 'tbl_products';
    $products       =  getAll($products_table);

    
    if(!$products){
        $message = 'Failed to get product list';
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
</head>
<body>
    <h2>Edit a product</h2>
    <?php echo !empty($message)?$message:'';?>
    <table>
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Product Price</th>
                <th>Product Review</th>
                <th>Product Brand</th>
                <th>Product Image</th>
                <th>Edit</th>
            </tr>
        </thead>
        <tbody>
        <?php while($product = $products->fetch(PDO::FETCH_ASSOC)):?>
            <tr>
                <td><?php echo $product['product_id'];?></td>
                <td><?php echo $product['product_name'];?></td>
                <td><?php echo $product['product_price'];?></td>
                <td><?php echo $product['product_review'];?></td>
                <td><?php echo $product['product_brand'];?></td>
                <td><img width="150px" src="../images/<?php echo $product['product_image'];?>" alt="<?php echo $product['product_name'];?> Image"></td>
                
                <td><a href="edit_product.php?id=<?php echo $product['product_id'];?>">Edit Product</a></td>
            </tr>
        <?php endwhile;?>
        </tbody>
    </table>
    <br>
    <a href="index.php">Go Back...</a>
    
</body>
</html>